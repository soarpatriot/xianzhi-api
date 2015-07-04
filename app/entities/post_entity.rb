class PostEntity < Grape::Entity
  expose :id,             documentation: {required: true, type: "Integer", desc: "id"}
  expose :user_id,        documentation: {required: true, type: "Integer", desc:"user id"}
  expose :description, documentation: {required: true, type: "String", desc:"description"}
  
  
  expose :user_avatar, documentation: {required: true, type: "String", desc:"用户头像"} do |instance|
    instance.user.try(:image_url)
  end
  expose :user_name, documentation: {required: true, type: "String", desc:"用户姓名"} do |instance|
    instance.user.try(:name)
  end
  
  expose :pictures do | instance |
    instance.pictures
  end

  expose :created_at,       documentation: {required: true, type: "Integer", desc: "创建时间"} do |instance|
       instance.created_at.to_i
  end
  
 
end
