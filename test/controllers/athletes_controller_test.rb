require 'test_helper'

class AthletesControllerTest < ActionController::TestCase
include Devise::TestHelpers

  setup do
    @athlete = athletes(:athlete)
  end

  test "should get index" do
    sign_in User.first
    get :index
    assert_response :success
  end

  test "should get show" do
    sign_in User.first
    get :show, id: User.first.id
    assert_response :success
  end

  test "should get new" do
    sign_in User.first
    get :new
    assert_response :success
  end

  test "should create athlete" do
    assert_difference('Athlete.count') do
      post :create, athlete: @athlete.attributes
    end
  end

  test "should get edit" do
    sign_in User.first
    get :edit, id: User.first.id
    assert_response :success
  end
end
