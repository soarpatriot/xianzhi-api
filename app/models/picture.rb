class Picture < ActiveRecord::Base
 
  mount_uploader :image, ThingImageUploader
end
