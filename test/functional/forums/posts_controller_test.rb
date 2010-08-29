require 'test_helper'

class Forums::PostsControllerTest < ActionController::TestCase
  setup do
    @forums_post = forums_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:forums_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create forums_post" do
    assert_difference('Forums::Post.count') do
      post :create, :forums_post => @forums_post.attributes
    end

    assert_redirected_to forums_post_path(assigns(:forums_post))
  end

  test "should show forums_post" do
    get :show, :id => @forums_post.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @forums_post.to_param
    assert_response :success
  end

  test "should update forums_post" do
    put :update, :id => @forums_post.to_param, :forums_post => @forums_post.attributes
    assert_redirected_to forums_post_path(assigns(:forums_post))
  end

  test "should destroy forums_post" do
    assert_difference('Forums::Post.count', -1) do
      delete :destroy, :id => @forums_post.to_param
    end

    assert_redirected_to forums_posts_path
  end
end
