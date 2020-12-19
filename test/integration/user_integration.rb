require 'test_helper'

class UserIntegrationTest < ActionDispatch::IntegrationTest
  setup do
    @test_email = 'test_user@yandex.ru'
    @test_password = 'test_user'
    @test_new_email = 'test_user@gmail.com'
    @test_new_password = 'new_test_user'
  end

  def log_in_for_test
    @user = User.new(email: @test_email, password: @test_password)
    @user.save
    visit new_user_session_path

    fill_in 'Email', with: @user.email
    fill_in I18n.t('Password'), with: @user.password
    click_button I18n.t('Log in')
  end

  test "sign up test" do
    visit new_user_registration_path

    fill_in 'Email', with: @test_email
    fill_in I18n.t('Password'), with: @test_password 
    fill_in I18n.t('Password confirmation'), with: @test_password
    click_button I18n.t('Sign up')
    assert_current_path root_path
    assert has_content?(I18n.t('To events'))
  end

  test "log in test" do
    @user = User.new(email: @test_email, password: @test_password)
    @user.save
    visit new_user_session_path

    fill_in 'Email', with: @user.email
    fill_in I18n.t('Password'), with: @user.password
    click_button I18n.t('Log in')
    assert_current_path root_path
    assert has_content?(I18n.t('To events'))
  end

  test "edit user test" do
    log_in_for_test

    visit edit_user_registration_path
    # click_on "Edit", match: :first

    fill_in 'Email', with: @test_new_email
    fill_in I18n.t('Password'), with: @test_new_password
    fill_in I18n.t('Password confirmation'), with: @test_new_password
    fill_in I18n.t('Current password'), with: @user.password

    click_button I18n.t('Update')
    assert_current_path root_path
    assert has_content?('Ваша учётная запись успешно изменена.')
  end

  test "destroy user test" do
    log_in_for_test

    visit edit_user_registration_path

    click_button I18n.t('Cancel my account')
    assert_current_path root_path
    assert has_content?('До свидания! Ваша учётная запись успешно удалена. Надеемся снова увидеть вас.')
    assert has_content?(I18n.t('Get started'))
  end

  test "no access without login" do
    get '/static_pages/user_events'
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end  
   
end