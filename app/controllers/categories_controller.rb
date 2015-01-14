class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def create
    @admin = Admin.find(category_params[:admin_id])
    @admin.categories.create(category_params)
    redirect_to admin_path(@admin)
  end

  def destroy
    category = Category.find(params[:id])
    @admin = category.admin
    category.destroy
    redirect_to admin_path(@admin)
  end

private
  def category_params
    params.require(:category).permit(:name, :admin_id)
  end
end
