class UserMailer < ActionMailer::Base
  def registration_confirmation(user)
    mail(:to => user.email, :subject => "Registered", :from => "santoshkosgi@qed42.com", :tag => "registration")
  end

end
