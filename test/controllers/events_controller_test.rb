require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @event_data = {
      name: "MyString",
      start_date: DateTime.now + 2.hours,
      end_date: DateTime.now + 15.hours,
      description: "MyString"
    }
  end

  test 'should get index' do
      get events_path
      assert_response :success
  end

  test 'authenticated users can create events' do
      sign_in users(:one)
      get new_event_path
      assert_response :success
  end

  test 'unauthenticated users cant create events' do
      get new_event_path
      assert_response :redirect
  end

  test "should show event" do
    user = User.new({
      :email => 'test@gmail.com',
      :password => "devisetest",
      :password_confirmation => "devisetest"
      })
    user.save
    sign_in user

    @event = Event.new(@event_data)
    @event[:user_id] = user.id
    @event.save!
    get ('/events/' + @event.id.to_s)
    assert_response :success
  end

  test "should get edit" do
    user = User.new({
      :email => 'test@gmail.com',
      :password => "devisetest",
      :password_confirmation => "devisetest"
      })
    user.save
    sign_in user

    @event = Event.new(@event_data)
    @event[:user_id] = user.id
    @event.save!
    get ('/events/' + @event.id.to_s + '/edit/')
    assert_response :success
  end
end
