class Hotel < ActiveRecord::Base
  has_many :fooditems
  has_many :comments, :as => :commentable
end
