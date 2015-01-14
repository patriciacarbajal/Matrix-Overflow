class Post < ActiveRecord::Base
  validates  :title, :content, presence: true

  has_many   :votes, as: :voteable

  belongs_to :category
  belongs_to :user

  #Polymorphic Association
  belongs_to :parent, class_name: 'Post', foreign_key: :parent_id
  has_many :children, class_name: 'Post', foreign_key: :parent_id
end
