class CategoriesController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
    @id = session[:user_id]
    if @id == nil
      redirect_to '/authorized'
    else
      @category = Category.new
    end
  end

  def change
    @category_id = params[:category_id]
    if @category_id == nil
      flash[:alert] = "There seems to be a problem, while updating your inputs."
      redirect_to '/authorized'
    else
      @category = Category.find_by(id: @category_id)
    end
  end

  def create
    user = User.find_by_id(session[:user_id])
    @category = user.categories.new(category_params)
    if @category.save 
      redirect_to '/authorized'
    else
      render :new 
    end 
  end

  def update  
    @category = Category.find_by_id(params[:id])
    if @category.update(category_params)
      redirect_to '/authorized'
    else
      render '/categories/change'
    end
  end

  def delete  
    Category.find_by_id(params[:id]).delete
    if Task.where(category_id:params[:id]).count > 0
      Task.where(category_id:params[:id]).delete_all
      redirect_to '/authorized'
    else
      redirect_to '/authorized'
    end
  end

  private 

  def category_params
    params.require(:category).permit(:category_name,:category_details)
    #params.require(:category).permit(:category_name,:user_id,:category_details)
  end
end
