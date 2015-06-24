class PictureEntity < Grape::Entity
  expose :id,             documentation: {required: true, type: "Integer", desc: "id"}
  expose :post_id,        documentation: {required: true, type: "Integer", desc:"post id"}
  expose :image,        documentation: {required: true, type: "String", desc:"image url"}
  
  expose :created_at,       documentation: {required: true, type: "Integer", desc: "创建时间"} do |instance|
       instance.created_at.to_i
  end
  
 
end
