class Category < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many  :posts
  belongs_to :admin
end
