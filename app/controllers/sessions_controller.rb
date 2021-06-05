class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/authorized'
    else
      flash[:alert] = "Invalid Username or Password"
      render :new
    end
  end

  def index
    @category_id = params[:category_id] 
    if @category_id == nil
      @category = Category.where(user_id: session[:user_id]).sort_by {|obj| obj.updated_at}.reverse
      catids = @category.pluck(:id)
      task = Task.where(category_id: catids,complete: 0)
      @urgent_task = task.where("due_date <= ?", Date.today).sort_by {|obj| obj.due_date}
      @urgent_task_count = task.where("due_date <= ?", Date.today).count
      @upcoming_task = task.where("due_date > ?", Date.today).sort_by {|obj| obj.due_date}
      @upcoming_task_count = task.where("due_date > ?", Date.today).count
    else
      @category = Category.where(user_id: session[:user_id]).sort_by {|obj| obj.updated_at}.reverse
      @chosen_category = Category.where(id: @category_id).sort_by {|obj| obj.updated_at}.reverse
      catids = @chosen_category.pluck(:id)
      task = Task.where(category_id: catids,complete: 0)
      @urgent_task = task.where("due_date <= ?", Date.today).sort_by {|obj| obj.due_date}
      @urgent_task_count = task.where("due_date <= ?", Date.today).count
      @upcoming_task = task.where("due_date > ?", Date.today).sort_by {|obj| obj.due_date}
      @upcoming_task_count = task.where("due_date > ?", Date.today).count
    end
  end

  def login
  end

  def welcome
    if logged_in?
      redirect_to '/authorized'
    end
  end

  def out
    session[:user_id] = nil
    redirect_to root_path
  end
end
