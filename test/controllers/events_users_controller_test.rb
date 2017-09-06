require 'test_helper'

class EventsUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @events_user = events_users(:one)
  end

  test "should get index" do
    get events_users_url
    assert_response :success
  end

  test "should get new" do
    get new_events_user_url
    assert_response :success
  end

  test "should create events_user" do
    assert_difference('EventsUser.count') do
      post events_users_url, params: { events_user: { rating: @events_user.rating, status: @events_user.status } }
    end

    assert_redirected_to events_user_url(EventsUser.last)
  end

  test "should show events_user" do
    get events_user_url(@events_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_events_user_url(@events_user)
    assert_response :success
  end

  test "should update events_user" do
    patch events_user_url(@events_user), params: { events_user: { rating: @events_user.rating, status: @events_user.status } }
    assert_redirected_to events_user_url(@events_user)
  end

  test "should destroy events_user" do
    assert_difference('EventsUser.count', -1) do
      delete events_user_url(@events_user)
    end

    assert_redirected_to events_users_url
  end
end
