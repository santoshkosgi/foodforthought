class User < ActiveRecord::Base
  acts_as_authentic

  def password_reset_instructions!
    reset_perishable_token!
    Notifier.delay.deliver_password_reset_instructions(self)
  end

end    
