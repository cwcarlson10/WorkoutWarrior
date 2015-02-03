require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  def setup
    @athlete_1 = athletes(:athlete_1)
    @trainer_1 = trainers(:trainer_1)
    @athlete_user = @athlete_1.user
    @trainer_user = @trainer_1.user
  end

  test "Get / should return the home page" do
    get :home
    assert_response :success
    assert_template :home
  end

  test "Get / should return @athlete as athlete" do
    current_user = sign_in @athlete_user
    assert current_user, "User didn't log in"

    get :home
    @athlete = assigns(:athlete)
    assert_not_nil @athlete, "@athlete:#{@athlete} wasn't set by the controller"

    # trainer should be nil when not signed in as a trainer
    @trainer = assigns(:trainer)
    assert_nil @trainer, "@trainer:#{@trainer} was set by the controller"
  end

  test "Get / should return @trainer as trainer" do
    current_user = sign_in @trainer_user
    assert current_user, "User didn't log in"

    get :home
    @trainer = assigns(:trainer)
    assert_not_nil @trainer, "@trainer:#{@trainer} wasn't set by the controller"

    # athlete should be nil when not signed in as a trainer
    @athlete = assigns(:athlete)
    assert_nil @athlete, "@athlete:#{@athlete} was set by the controller"
  end

  test "Get /about should return @athlete as athlete" do
    current_user = sign_in @athlete_user
    assert current_user, "User didn't log in"

    get :about
    @athlete = assigns(:athlete)
    assert_not_nil @athlete, "@athlete:#{@athlete} wasn't set by the controller"

    # trainer should be nil when not signed in as a trainer
    @trainer = assigns(:trainer)
    assert_nil @trainer, "@trainer:#{@trainer} was set by the controller"
  end

  test "Get /about should return @trainer as trainer" do
    current_user = sign_in @trainer_user
    assert current_user, "User didn't log in"

    get :about
    @trainer = assigns(:trainer)
    assert_not_nil @trainer, "@trainer:#{@trainer} wasn't set by the controller"

    # athlete should be nil when not signed in as a trainer
    @athlete = assigns(:athlete)
    assert_nil @athlete, "@athlete:#{@athlete} was set by the controller"
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
