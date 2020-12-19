require "application_system_test_case"

class VisitorsTest < ApplicationSystemTestCase
  setup do
    @test_email = 'test_user@yandex.ru'
    @test_password = 'test_user'
    @event = {
            name: "MyString",
            start_date: DateTime.now,
            end_date: DateTime.now + 15.hours,
            description: "MyString"
    }
    @new_event = {
            name: "MyStringNew",
            start_date: DateTime.now + 2.hours,
            end_date: DateTime.now + 17.hours,
            description: "MyStringNew"
    }
  end

  def log_in_for_test
    @user = User.new(email: @test_email, password: @test_password)
    @user.save
    visit new_user_session_path

    fill_in 'Email', with: @user.email
    fill_in I18n.t('Password'), with: @user.password
    click_button I18n.t('Log in')
  end

  def create_event_for_test
    visit new_event_path

    fill_in I18n.t('Name'), with: @event[:name]
    fill_in I18n.t('Event starts (GMT+3 Moscow)'), with: @event[:start_date]
    fill_in I18n.t('Event ends (GMT+3 Moscow)'), with: @event[:end_date]
    fill_in I18n.t('Description'), with: @event[:description]

    click_button I18n.t('Create')
  end
 

  test "adding Visitor for an Event" do
    log_in_for_test
    create_event_for_test

    visit events_path
    click_on I18n.t('I will go!'), match: :first

    assert_text I18n.t('Thank you for registration')

    visit events_path
    click_on I18n.t('I will go!'), match: :first

    assert_text I18n.t('User with this email is already registered')
  end

end
