class PictureEntity < Grape::Entity
  expose :id,             documentation: {required: true, type: "Integer", desc: "id"}
  expose :post_id,        documentation: {required: true, type: "Integer", desc:"post id"}
  
  expose :url,        documentation: {required: true, type: "String", desc:"image url"} do | instance |
    instance.image.url
  end
  expose :thumb_url,        documentation: {required: true, type: "String", desc:"image thumb url"} do | instance |
    "#{instance.try(:image).try(:url)}-thumbnail"
  end
 
  expose :name,        documentation: {required: true, type: "String", desc:"image url"} do | instance |
    instance.image.filename
  end
  
  expose :image_type,        documentation: {required: true, type: "String", desc:"image type"} do | instance |
    instance.image.content_type
  end
  expose :size,        documentation: {required: true, type: "String", desc:"image size"} do | instance |
    instance.image.size
  end

  expose :created_at,       documentation: {required: true, type: "Integer", desc: "创建时间"} do |instance|
       instance.created_at.to_i
  end
  
 
end
