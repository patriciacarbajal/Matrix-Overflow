class SessionsController < ApplicationController
  def new
    #just so that you can get to login
  end

  def create
    params[:session]
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      login(user)
      redirect_to root_path
    else
      set_error('Invalid Login Attempt.  Please Try Again.')
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
