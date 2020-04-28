require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: "sports")
    @user = User.create(username: "atomic", email: "atomic@example.com", password: "atomic", admin: true)
  end

  test "should get categories index" do
    get categories_path
    assert_response :success
    
  end

  test "should get new" do
    sign_in_as(@user,"atomic")
    get new_category_path
    assert_response :success
    
  end

  test "should get show" do
    get category_path(@category)
    assert_response :success
    
  end

end