require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(email:"test@gmail.com",username:"test",password:"test")
    post login_path, params: {username: @user.username, password: "test"}
  end

  test 'get create category page' do
    get categories_new_path
    assert_response :success
  end

  test 'get edit category page' do
    get categories_change_path
    assert_response :redirect
  end

  test 'should be able to create category' do
    post categories_create_path, params: { category: {category_name: "Test", category_details: "Test"} }
    assert_response :redirect
  end

  test 'should be able to update category' do
    category = @user.categories.create(category_name:"Test")
    put categories_update_path(category), params: { category: {category_name: "Test", category_details: "Test"} }
    assert_response :redirect
  end

  test 'should be able to delete category' do
    category = @user.categories.create(category_name:"Test")
    delete categories_delete_path(category)
    assert_response :redirect
  end
end

