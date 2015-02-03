require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  def setup
  end

  test "Get / should return the home page" do
    get :home
    assert_response :success
    assert_template :home
  end

  test "Get /about should return the home page" do
    get :about
    assert_response :success
    assert_template :about
  end

  test "Get /role should return the role page" do
    get :role
    assert_response :success
    assert_template :role
  end
end
