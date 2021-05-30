require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_new_path
    assert_response :success
  end

  test "should get create" do
    get users_create_path    
    assert_response :success
  end 

  test 'should create user' do
    post users_create_path, params: { user: {email:'test@gmail.com',username:'test',password:'test'} }
    assert_response :redirect
  end
end
