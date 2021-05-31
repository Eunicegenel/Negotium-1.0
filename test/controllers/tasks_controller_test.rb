require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  test 'get create category page' do
    get tasks_new_path
    assert_response :redirect
  end

  test 'should be able to create task' do
    post tasks_create_path, params: { task: {task_name:"Buy Milk",user_id:1,cat_id:1,task_details:"Choco Milk + Non-Fat Milk + Normal Milk = $12",due_date:"29-05-2010",complete:false} }
    assert_response :success
  end

  test 'get change task page' do
    get tasks_change_path
    assert_response :redirect
  end

  test 'should be able to update task' do
    put tasks_update_path, params: { task: {task_name:"Buy Milk",user_id:1,cat_id:1,task_details:"Choco Milk + Non-Fat Milk + Normal Milk = $12",due_date:"29-05-2010",complete:false} }
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
