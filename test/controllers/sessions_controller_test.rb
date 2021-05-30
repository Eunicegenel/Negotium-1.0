require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get login page' do
    get login_path
    assert_response :success
  end

  test 'should get welcome page' do
    get welcome_path
    assert_response :success
  end

  test 'should be able to login' do
    @user = User.create(email:"test@gmail.com",username:"test",password:"test")
    post login_path, params: { username:"test",password:"test" }
    assert_response :redirect
  end

  test 'should only open to authorized user' do
    get authorized_path
    assert_response :redirect
  end

  test 'should logout' do
    get logout_path
    assert_response :redirect
  end
end
