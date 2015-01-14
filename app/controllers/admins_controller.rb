class AdminsController < ApplicationController
  def index
    @admin = ""
  end

  def check
    @admin = params[:admin_id]
    if @admin == "Matrix"
      session[:valid] = true
      redirect_to new_admin_path
    else
      flash[:danger] = "Wrong Key. Hint: Take the red pill"
      redirect_to admins_path
    end
  end

  def create
    @admin = Admin.new admin_params
    if @admin.save
      session[:admin_id] = @admin.id
      redirect_to admin_path(@admin)
    else
      flash[:danger] = @admin.errors.messages
      render :new
    end
  end

  def login
    @admin = Admin.find_by(username: params[:username])
    if @admin && @admin.authenticate(params[:password])
      redirect_to admin_path(@admin)
    else
      flash[:danger] = "You haven't entered the matrix correctly. Your username and password do not match"
      redirect_to admins_path
    end
  end

  def new
    if session[:valid] == true
      @admin = Admin.new
    else
      redirect_to admins_path(@admin)
    end
  end

  def destroy

  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
   @admin = Admin.find(params[:id])
   @admin.update_attributes(username: admin_params[:username], email:admin_params[:email])
   redirect_to admin_path(@admin)
  end

  def show
    @admin = Admin.find params[:id]
    @category = Category.new
    render :show
  end

  private

  def admin_params
    params.require(:admin).permit(:username, :email, :password, :id)
  end
end
