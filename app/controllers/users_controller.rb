class UsersController < ApplicationController

  def new
    @user=User.new
  end

  def create
    @user = User.new(params[:user])
      if @user.save
         UserMailer.delay.registration_confirmation(@user)
         redirect_to :action => "show", :id=> @user.id
      else
         render :action => "new"
      end
  end

  def show

  end

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      redirect_to :action => "index", :controller => "user_sessions"
    else
      render :action => "edit"
    end
  end
end
