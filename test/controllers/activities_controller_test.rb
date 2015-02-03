require 'test_helper'

class ActivitiesControllerTest < ActionController::TestCase
include Devise::TestHelpers
  setup do
    @user = users(:athlete_user_1)
    sign_in @user
    @athlete = @user.athlete
    @program = programs(:program_1)
    @activity = Activity.create!(athlete_id: @athlete.id, program_id: @program.id)
  end

  test "should create activity" do
    assert_difference('Activity.count') do
      post :create, activity: {athlete_id: @athlete.id, program_id: @program.id}
    end

    assert_redirected_to athlete_path(assigns(:athlete))
  end

end
