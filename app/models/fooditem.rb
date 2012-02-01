class Fooditem < ActiveRecord::Base
  belongs_to :hotel
  has_many :comments, :as => :commentable
end
