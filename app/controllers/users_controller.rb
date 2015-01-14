class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      login(@user)
      redirect_to root_path
    else
      session[:error] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    @user = current_user
  end

def update
    @user = current_user
    @user.assign_attributes(user_params)
    if @user.save
      redirect_to root_path
    else
      session[:error] = @user.errors.full_messages
      render :edit
    end
end

def destroy
    @user = current_user
    @user.destroy
    redirect_to root_path
end

  private
  def user_params
    params.require(:user).permit(:id, :username, :email, :password, :password_confirmation)
  end
end
