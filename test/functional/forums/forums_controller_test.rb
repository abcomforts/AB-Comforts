require 'test_helper'

class Forums::ForumsControllerTest < ActionController::TestCase
  setup do
    @forums_forum = forums_forums(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:forums_forums)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create forums_forum" do
    assert_difference('Forums::Forum.count') do
      post :create, :forums_forum => @forums_forum.attributes
    end

    assert_redirected_to forums_forum_path(assigns(:forums_forum))
  end

  test "should show forums_forum" do
    get :show, :id => @forums_forum.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @forums_forum.to_param
    assert_response :success
  end

  test "should update forums_forum" do
    put :update, :id => @forums_forum.to_param, :forums_forum => @forums_forum.attributes
    assert_redirected_to forums_forum_path(assigns(:forums_forum))
  end

  test "should destroy forums_forum" do
    assert_difference('Forums::Forum.count', -1) do
      delete :destroy, :id => @forums_forum.to_param
    end

    assert_redirected_to forums_forums_path
  end
end
