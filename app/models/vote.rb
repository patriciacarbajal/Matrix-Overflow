class Vote < ActiveRecord::Base
  belongs_to :voteable, polymorphic: true
  belongs_to :user
  validates :user_id, :uniqueness => { :scope => [:voteable_type, :voteable_id] }
end
