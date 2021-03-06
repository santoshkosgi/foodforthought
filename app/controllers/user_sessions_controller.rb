class UserSessionsController < ApplicationController

  skip_before_filter :require_login, :only => [:new, :create]

  def new
    @user_session = UserSession.new
  end

  # GET /user_sessions/1/edit

  # POST /user_sessions
  # POST /user_sessions.json
  def create
    @user_session = UserSession.new(params[:user_session])

      if @user_session.save
        redirect_to :action => "index"
      else
        render :action => "new"
      end
  end

  # PUT /user_sessions/1
  # PUT /user_sessions/1.json

  # DELETE /user_sessions/1
  # DELETE /user_sessions/1.json
  def destroy
    @user_session = UserSession.find
    @user_session.destroy

       redirect_to root_url
  end
end
