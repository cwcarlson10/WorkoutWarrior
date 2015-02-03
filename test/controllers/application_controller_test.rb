require 'test_helper'

class ApplicationControllerTest < ActionController::TestCase
include Devise::TestHelpers



  def setup
    request.env['devise.mapping'] = Devise.mappings[:user]
    @trainer = trainers(:trainer_1)
    @athlete = athletes(:athlete_1)
    @user1 = @trainer.user
    @user2 = @athlete.user
    @user = users(:newuser)
  end

  test "should sign in as trainer" do
    sign_in @user1
    @controller.after_sign_in_path_for(@user1.id)
    assert_response :success
  end

  test "should sign in as athlete" do
    sign_in @user2
    @controller.after_sign_in_path_for(@user2.id)
    assert_response :success
  end

  test "should get all unassigned athletes" do
    sign_in @user1
    @controller.unassigned_athletes
    athletes = assigns(:unassigned_athletes)
    assert_response :success
  end

  test "should redirect to role page role not assigned" do
    sign_in @user
    @controller.after_sign_in_path_for(@user)
    assert_response :success
  end

end