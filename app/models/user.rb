class User < ActiveRecord::Base
  acts_as_authentic do |configuration|
    configuration.session_class = UserSession
  end
  attr_accessor :name, :password
  attr_accessible :name, :password

end    
