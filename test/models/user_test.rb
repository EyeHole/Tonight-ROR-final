require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'sign up' do
    user = User.new({
    :email => 'test@gmail.com',
    :password => "devisetest",
    :password_confirmation => "devisetest"
    })

    assert user.save
  end

  test 'edit user' do
    user = User.first
    new_data = {
    :email => "new@gmail.com",
    }
    new_data = ActionController::Parameters.new(new_data)
    new_data = new_data.permit(:email)
    user.update_without_password(new_data)

    assert_equal user.email, "new@gmail.com"
  end

  test 'user duplicate' do
    user = User.new({
      :email => "test@gmail.com",
      :password => "devisetest",
      :password_confirmation => "devisetest"
      })
    user.save

    user = User.new({
      :email => "test@gmail.com",
      :password => "devisetest",
      :password_confirmation => "devisetest"
      })
    assert_not user.save

    assert_equal User.where(email: "test@gmail.com").count, 1
   end
end
