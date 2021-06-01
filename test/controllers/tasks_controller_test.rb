require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  test 'get create category page' do
    get tasks_new_path
    assert_response :redirect
  end

  test 'should be able to create task' do
    category = Category.create(category_name:"Test")
    post tasks_create_path, params: { task: {task_name:"Buy Milk",category_id:category.id,task_details:"Choco Milk + Non-Fat Milk + Normal Milk = $12",due_date:"29-05-2010",complete:0} }
    assert_response :success
  end

  test 'get change task page' do
    get tasks_change_path
    assert_response :redirect
  end

  test 'should be able to update task' do
    category = Category.create(category_name:"Test")
    task = Task.create(task_name:"Buy Milk",category_id:category.id,task_details:"Choco Milk + Non-Fat Milk + Normal Milk = $12",due_date:"29-05-2010",complete:0)
    put tasks_update_path, params: { task: {task_name:"Buy Bread",category_id:category.id,task_details:"Wheat Bread = $15",due_date:"29-05-2010",complete:0} }
    assert_response :redirect
  end

  test 'should be able to delete task' do
    delete tasks_delete_path
    assert_response :redirect
  end

  test 'should finish task' do
    put tasks_update_path
    assert_response :redirect
  end
end
