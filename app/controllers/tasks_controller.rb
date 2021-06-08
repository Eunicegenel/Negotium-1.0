class TasksController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
    @category_id = params[:id]
    @task = Task.new
  end

  def change
    @task = Task.find_by_id(params[:id])
  end

  def create
    @category_id = params[:category_id]
    if @category_id == "new" 
      flash[:alert] = "Task not saved."
      redirect_to '/authorized'
    else
      @chosen_category = Category.find_by_id(@category_id)
      @task = @chosen_category.tasks.new(task_params)
      if @task.save 
        @category = Category.find_by_id(@category_id).category_name
        newtask = Task.where(category_id: @category_id).sort_by {|obj| obj.updated_at}.reverse
        newtask[0].update(category_name: @category)
        @task.errors.full_messages
        redirect_to '/authorized'
      else
        @category_id = params[:category_id]
        render '/categories'
      end 
    end
  end

  def update  
    @task = Task.find_by_id(params[:id])
    if @task.update(task_params)
      redirect_to '/authorized'
    else
      render '/tasks/change'
    end
  end

  def delete  
    Task.find_by_id(params[:id]).delete
    redirect_to '/authorized'
  end

  def finish
    Task.find_by_id(params[:id]).update(complete:1)
    redirect_to '/authorized'
  end

  private 

  def task_params
    params.require(:task).permit(:task_name,:task_details,:due_date,:complete)
  end
end
