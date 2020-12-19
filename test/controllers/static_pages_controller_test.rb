require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
  end

  test "authenticated should get profile" do
    sign_in users(:one)
    get static_pages_profile_url
    assert_response :success
  end

  test 'unauthenticated should not get profile' do
    get static_pages_profile_url
    assert_response :redirect
  end

  test "authenticated should get user_events and user_visitor" do
    sign_in users(:one)

    get static_pages_user_events_url
    assert_response :success

    get static_pages_user_visitor_url
    assert_response :success
  end

  test 'unauthenticated should not get user_events and user_visitor' do
    get static_pages_user_events_url
    assert_response :redirect

    get static_pages_user_visitor_url
    assert_response :redirect
  end

end
