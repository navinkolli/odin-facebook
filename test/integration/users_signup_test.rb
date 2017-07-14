require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test 'invalid signup submission' do
    get new_user_registration_path
    assert_no_difference 'User.count' do
      post user_registration_path, params: { user: {
        name: '',
        email: 'user@invalid',
        password: 'foo',
        password_confirmation: 'bar'
      } }
    end
    assert_template 'devise/registrations/new'
    assert_select 'div.alert'
    assert_select 'div.field_with_errors'
  end

  test 'valid signup submission' do
    get new_user_registration_path
    assert_difference 'User.count', 1 do
      post user_registration_path, params: { user: {
        name: 'Example User',
        email: 'user@example.com',
        password: 'password',
        password_confirmation: 'password'
      } }
    end
    assert_response :redirect
    follow_redirect!
    assert_template 'users/show'
    assert_select 'div.alert'
  end
end
