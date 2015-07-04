class PictureEntity < Grape::Entity
  expose :id,             documentation: {required: true, type: "Integer", desc: "id"}
  expose :post_id,        documentation: {required: true, type: "Integer", desc:"post id"}
  
  expose :image_url,        documentation: {required: true, type: "String", desc:"image url"} do | instance |
    instance.image.url
  end
  expose :image_type,        documentation: {required: true, type: "String", desc:"image type"} do | instance |
    instance.image.content_type
  end
  expose :image_size,        documentation: {required: true, type: "String", desc:"image size"} do | instance |
    instance.image.size
  end

  

  expose :created_at,       documentation: {required: true, type: "Integer", desc: "创建时间"} do |instance|
       instance.created_at.to_i
  end
  
 
end
