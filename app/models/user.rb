class User < ActiveRecord::Base
  acts_as_authentic do |configuration|
    configuration.session_class = UserSession
  end
end    
