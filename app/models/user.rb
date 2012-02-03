class User < ActiveRecord::Base
  acts_as_authentic

  def password_reset_instructions!
    reset_perishable_token!
    Notifier.delay.deliver_password_reset_instructions(self)
  end

  has_attached_file :photo, :style => {:small => "150x150>"},
                    :url => "/assests/users/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assests/users/:id/:style/:basename.:extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than =>5.megabytes
  validates_attachment_content_type :photo, :content_type => ["image/jpeg","image/png"]
end    
