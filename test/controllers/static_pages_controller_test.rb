require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  test "when root url is visited" do
    get root_path
    assert_response :success
    assert_select 'title', 'Home | Friend Space'
  end

  test "should get home" do
    get home_path
    assert_response :success
    assert_select 'title', 'Home | Friend Space'
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select 'title', 'About | Friend Space'
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select 'title', 'Contact | Friend Space'
  end
end
