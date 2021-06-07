require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    user = User.create(email:"test@gmail.com",username:"test",password:"test")
    post login_path, params: {username: user.username, password: "test"}
    @category = user.categories.create(category_name:"Test")
  end

  test 'get create category page' do
    get tasks_new_path
    assert_response :redirect
  end

  test 'should be able to create task' do
    post tasks_create_path, params: { task: {task_name:"Buy Milk",task_details:"Choco Milk = $12",due_date:"29-05-2010",complete:0} }
    assert_response :success
  end

  test 'get change task page' do
    get tasks_change_path
    assert_response :redirect
  end

  test 'should be able to update task' do
    task = @category.tasks.create(task_name:"Buy Milk",task_details:"Choco Milk = $12",due_date:"29-05-2010",complete:0)
    put tasks_update_path(task), params: { task: {task_name:"Buy Bread",task_details:"Wheat Bread = $15",due_date:"29-05-2010",complete:0} }
    assert_response :redirect
  end

  test 'should be able to delete task' do
    task = @category.tasks.create(task_name:"Buy Milk",task_details:"Choco Milk = $12",due_date:"29-05-2010",complete:0)
    delete tasks_delete_path(task)
    assert_response :redirect
  end

  test 'should finish task' do
    task = @category.tasks.create(task_name:"Test", task_details:"test", due_date:"29-05-2010", complete:"0")
    put tasks_update_path(task), params: { task: {complete:"1"} }
    assert_response :redirect
  end
end
