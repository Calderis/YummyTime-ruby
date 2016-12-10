require 'test_helper'

class FollowedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @followed = followeds(:one)
  end

  test "should get index" do
    get followeds_url
    assert_response :success
  end

  test "should get new" do
    get new_followed_url
    assert_response :success
  end

  test "should create followed" do
    assert_difference('Followed.count') do
      post followeds_url, params: { followed: { followed_id: @followed.followed_id, follower_id: @followed.follower_id, type: @followed.type } }
    end

    assert_redirected_to followed_url(Followed.last)
  end

  test "should show followed" do
    get followed_url(@followed)
    assert_response :success
  end

  test "should get edit" do
    get edit_followed_url(@followed)
    assert_response :success
  end

  test "should update followed" do
    patch followed_url(@followed), params: { followed: { followed_id: @followed.followed_id, follower_id: @followed.follower_id, type: @followed.type } }
    assert_redirected_to followed_url(@followed)
  end

  test "should destroy followed" do
    assert_difference('Followed.count', -1) do
      delete followed_url(@followed)
    end

    assert_redirected_to followeds_url
  end
end
