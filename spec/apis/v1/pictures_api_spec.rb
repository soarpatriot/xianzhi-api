require "spec_helper"

describe V1::PicturesApi do 
 
  let(:upload_picture_path) {"v1/pictures"} 
  
  def delete_file_path picture 
    "v1/pictures/#{picture.id}" 
  end

  context "upload file" do 
    it "to qiniu" do 
      post = create :post     
      image = File.open("#{G2.config.root_dir}/app/assets/images/day3.jpg")
      res = data_post upload_picture_path, image: image, post_id: post.id 
      expect(res.status).to eq(201)
    end
  end

  context "delete file" do 
    it "to qiniu" do 
      picture = create :picture     
      res = data_delete delete_file_path(picture)
      expect(res.status).to eq(200)
    end
  end

end
