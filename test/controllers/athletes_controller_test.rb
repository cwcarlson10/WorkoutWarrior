require 'test_helper'

class AthletesControllerTest < ActionController::TestCase
include Devise::TestHelpers

  setup do
    sign_in User.first
    @athlete = athletes(:athlete_1)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, id: @athlete.id
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create athlete" do
    assert_difference('Athlete.count') do
      post :create, athlete: @athlete.attributes
    end

    assert_redirected_to athlete_path(assigns(:athlete))
  end

  test "should render new unless successful create" do
    post :create, athlete: {name: nil}
    assert_template 'new'
  end

  test "should get edit" do
    get :edit, id: @athlete.id
    assert_response :success
  end

  test "should update athlete" do
    patch :update, {id: @athlete.id, athlete: {trainer_id: @athlete.trainer_id, name: "Jimbo Connor"}}

    assert_redirected_to athlete_path(assigns(:athlete))
  end

  test "should render edit unless successful update" do
    patch :update, {id: @athlete.id, athlete: {trainer_id: @athlete.trainer_id, name: nil}}
    assert_template 'edit'
  end

  test "should delete athlete" do
    assert_difference('Athlete.count', - 1) do
      delete :destroy, id: @athlete
    end

    assert_redirected_to root_path
  end
end
