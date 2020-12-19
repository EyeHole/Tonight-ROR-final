require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def create_user_for_test
    user = User.new ({
      :email => "test@gmail.com",
      :password => "test_password",
      :password_confirmation => "test_password"
    })
    user.save
    user
  end

  def create_event_for_test(user)
    event = Event.new ({
      :name => "Test",
      :start_date => DateTime.now + 14.hours,
      :end_date => DateTime.now + 15.hours,
      :description => "Test",
      :user_id => user.id
    })

    event.save
  end

  test "new event" do
    user = create_user_for_test

    event = Event.new ({
      :name => "Test",
      :start_date => DateTime.now + 14.hours,
      :end_date => DateTime.now + 15.hours,
      :description => "Test",
      :user_id => user.id
    })
    assert event.save
  end

  test "edit event" do
    user = create_user_for_test
    create_event_for_test(user)
    
    event = Event.first
    new_data = {
      :name => "NewName",
      :description => "NewDescription",
    }
    new_data = ActionController::Parameters.new(new_data)
    new_data = new_data.permit(:name, :description)
    event.update(new_data)

    assert_equal event.name, "NewName"
    assert_equal event.description, "NewDescription"
  end
end
