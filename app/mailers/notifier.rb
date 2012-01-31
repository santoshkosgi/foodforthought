class Notifier < ActionMailer::Base

  def deliver_password_reset_instructions(user)
  mail(:to => user.email, :subject => "password reset instructions", :from => "santoshkosgi@qed42.com", :tag => "password reset")
  end

end  
