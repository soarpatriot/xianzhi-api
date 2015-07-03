class Picture < ActiveRecord::Base
 
  mount_uploader :image, ThingImageUploader
  
  def to_jq_upload
      {
              "id"   => id,
              "name" => image.filename,
              "size" => image.size,
              "url" => image.url,
              "type" => image.content_type,
              "thumbnailUrl" => image.thumb.url,
              "deleteUrl" => "#{Settings.host}/photos/#{id}",
              "deleteType" => "DELETE"
       }
   end
end
