class Fooditem < ActiveRecord::Base
  belongs_to :hotel
  has_many :comments, :as => :commentable

  has_attached_file :photo, :style => {:small => "150x150>"},
                    :url => "/assests/fooditems/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assests/fooditems/:id/:style/:basename.:extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than =>5.megabytes
  validates_attachment_content_type :photo, :content_type => ["image/jpeg","image/png"]
end
