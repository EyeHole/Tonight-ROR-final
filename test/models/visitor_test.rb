require 'test_helper'

class VisitorTest < ActiveSupport::TestCase
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
    event
  end

  test "new visitor" do
    user = create_user_for_test
    event = create_event_for_test(user)

    visitor = Visitor.new ({
      :user_id => user.id,
      :event_id => event.id
    })
    assert visitor.save
  end
end
