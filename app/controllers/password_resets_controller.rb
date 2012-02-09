class PasswordResetsController < ApplicationController
 def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user
      @user.password_reset_instructions!
      redirect_to root_path
    else
      flash.now[:error] = "No user was found with email address #{params[:email]}"
      render :action => :new
    end
  end

  def edit
  end

  def update
    @user.password = params[:password]
    # Only if your are using password confirmation
    # @user.password_confirmation = params[:password]

    # Use @user.save_without_session_maintenance instead if you
    # don't want the user to be signed in automatically.
    if @user.save
      flash[:success] = "Your password was successfully updated"
      redirect_to @user
    else
      render :action => :edit
    end
  end


  private

  def load_user_using_perishable_token
    @user = User.find_using_perishable_token(params[:id])
    unless @user
      flash[:error] = "We're sorry, but we could not locate your account"
      redirect_to root_url
    end
  end
end
