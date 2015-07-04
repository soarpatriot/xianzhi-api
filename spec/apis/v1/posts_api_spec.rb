require "spec_helper"

describe V1::PostsApi do 
 
  let(:post_path) {"v1/posts"} 
  context "post" do 
    it "create with picture" do 
      description = "aa"
      res = data_post post_path, description: description 
    end
    it "create with picture" do 
      description = "aa"
      pictures = create_list :picture, 10
      res = data_post post_path, description: description, picture_ids: pictures.map{|i| i.id}

    end
   
  end
end
