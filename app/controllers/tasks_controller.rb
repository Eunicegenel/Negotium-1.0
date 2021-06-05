class TasksController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
    @category_id = params[:category_id]
    if @category_id == nil
      flash[:alert] = "There seems to be a problem, while saving your inputs."
      redirect_to '/authorized'
    else
      @task = Task.new
      @id = session[:user_id]
    end
  end

  def change
    @task_id = params[:task_id]
    if @task_id == nil
      flash[:alert] = "There seems to be a problem, while updating your inputs."
      redirect_to '/authorized'
    else
      @task = Task.find_by(id: @task_id)
    end
  end

  def create
    @category_id = params[:category_id]
    @task = Task.new(task_params)
    @id = session[:user_id]
    if @task.save 
      @category = Category.find_by_id(@category_id).category_name
      tasks = Task.where(category_id:@category_id).sort_by {|obj| obj.updated_at}.reverse
      tasks[0].update(category_name:@category)
      task_date = tasks[0].due_date
      if task_date <= Date.today
        tasks[0].update(status:"urgent")
      else 
        tasks[0].update(status:"upcoming")
      end
      @task.errors.full_messages
      redirect_to '/authorized'
    else
      @category_id = params[:category_id]
      render :new
    end 
  end

  def update  
    @task = Task.find_by_id(params[:task_id])
    if @task.update(task_params)
      redirect_to '/authorized'
    else
      render '/tasks/change'
    end
  end

  def delete  
    Task.find_by_id(params[:task_id]).delete
    redirect_to '/authorized'
  end

  def finish
    Task.find_by_id(params[:task_id]).update(complete:1)
    redirect_to '/authorized'
  end

  private 

  def task_params
    params.require(:task).permit(:task_name,:category_id,:task_details,:due_date,:complete)
  end
end
