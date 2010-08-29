require 'test_helper'

class Forums::CategoriesControllerTest < ActionController::TestCase
  setup do
    @forums_category = forums_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:forums_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create forums_category" do
    assert_difference('Forums::Category.count') do
      post :create, :forums_category => @forums_category.attributes
    end

    assert_redirected_to forums_category_path(assigns(:forums_category))
  end

  test "should show forums_category" do
    get :show, :id => @forums_category.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @forums_category.to_param
    assert_response :success
  end

  test "should update forums_category" do
    put :update, :id => @forums_category.to_param, :forums_category => @forums_category.attributes
    assert_redirected_to forums_category_path(assigns(:forums_category))
  end

  test "should destroy forums_category" do
    assert_difference('Forums::Category.count', -1) do
      delete :destroy, :id => @forums_category.to_param
    end

    assert_redirected_to forums_categories_path
  end
end
