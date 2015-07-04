require "spec_helper"

describe V1::PicturesApi do 
 
  let(:upload_picture_path) {"v1/pictures"} 
  context "upload file" do 
    it "to qiniu" do 
      post = create :post     
      image = File.open("#{G2.config.root_dir}/app/assets/images/day3.jpg")
      res = data_post upload_picture_path, image: image, post_id: post.id 

    end
  end
end
