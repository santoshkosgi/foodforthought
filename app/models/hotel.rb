class Hotel < ActiveRecord::Base
  validates :name,  :presence => true
  validates :location, :presence => true
  has_many :fooditems
  has_many :comments, :as => :commentable
end
