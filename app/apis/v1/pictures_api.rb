class V1::PicturesApi < Grape::API

  resources :pictures do

    desc "获得post pictures list", {
        entity: PictureEntity
    }
    params do
      requires :post_id,type:Integer, desc: "1"
    end
    get do
      pictures = Picture.where(post_id: params[:post_id])
      present pictures, with: PictureEntity, current_user: current_user
    end
    
    desc "获得单个 picture", {
        entity: PictureEntity
    }
    params do
      requires :id ,type:Integer, desc: "id"
    end
    get "/:id" do
      picture = Picture.find(params[:id])
      present picture, with: PictureEntity
    end

    desc "upload picture", {
        entity: PictureEntity
    }
    params do
      requires :image 
      optional :post_id,type:Integer, desc: "post id"
    end
    post  do
      picture = Picture.new
      picture.post_id = params[:post_id] unless params[:post_id].nil?

      picture.image = params[:image]
      picture.save
      error! picture.errors.full_messages.join(","), 400 unless picture.persisted?

      present picture, with: PictureEntity
      files = []
      files << body()
      body({files: files })
    end
    
    desc "delete picture",{

    }
    params do 
      requires :id, type:Integer, desc: "id"
    end
    delete ":id" do 
      picture = Picture.find(params[:id])
      picture.remove_image!
      picture.save
      picture.destroy
    end
  end

end
