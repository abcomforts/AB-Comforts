require 'test_helper'

class Forums::TopicsControllerTest < ActionController::TestCase
  setup do
    @forums_topic = forums_topics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:forums_topics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create forums_topic" do
    assert_difference('Forums::Topic.count') do
      post :create, :forums_topic => @forums_topic.attributes
    end

    assert_redirected_to forums_topic_path(assigns(:forums_topic))
  end

  test "should show forums_topic" do
    get :show, :id => @forums_topic.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @forums_topic.to_param
    assert_response :success
  end

  test "should update forums_topic" do
    put :update, :id => @forums_topic.to_param, :forums_topic => @forums_topic.attributes
    assert_redirected_to forums_topic_path(assigns(:forums_topic))
  end

  test "should destroy forums_topic" do
    assert_difference('Forums::Topic.count', -1) do
      delete :destroy, :id => @forums_topic.to_param
    end

    assert_redirected_to forums_topics_path
  end
end
