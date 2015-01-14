module SessionsHelper
  def current_user
    # if current user is nil  then it will find the User and assign it to @current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def login(user)
    session[:user_id] = user.id
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
  end
end
