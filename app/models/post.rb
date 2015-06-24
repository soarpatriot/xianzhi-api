class Post < ActiveRecord::Base
  
  acts_as_votable

  default_scope {order("id desc")}
  belongs_to :user
  has_many :pictures 


end
