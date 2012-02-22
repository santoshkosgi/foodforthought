class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_login
  skip_before_filter :require_login, :only => [:index]
  helper_method :current_user

  #for checking authentication


  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session=UserSession.find
  end

  def current_user
     return @current_user if defined?(@current_user)
     @current_user = current_user_session && current_user_session.record
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to :controller => "user_sessions",:action =>"new" # halts request cycle
    end
  end

  # The logged_in? method simply returns true if the user is logged
  # in and false otherwise. It does this by "booleanizing" the
  # current_user method we created previously using a double ! operator.
  # Note that this is not common in Ruby and is discouraged unless you
  # really mean to convert something into true or false.
  def logged_in?
    !!current_user
  end

end
