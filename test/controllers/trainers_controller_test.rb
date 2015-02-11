require 'test_helper'

class TrainersControllerTest < ActionController::TestCase
include Devise::TestHelpers

  def setup
    @user3 = User.create!(email: "c@mail.com", password: "password", password_confirmation: "password", role: "trainer")
    @athlete = athletes(:athlete_1)
    @trainer = trainers(:trainer_1)
    @program = Program.create!(name: "first", trainer_id: @trainer.id)
    @user = @trainer.user
    @user2 = @athlete.user
    sign_in @user
  end

  test "should create a new trainer" do
    sign_in @user3
    assert_difference ('Trainer.count') do
    post :create, trainer: {name: "mav", user_id: @user3.id}
    end
    assert_redirected_to trainer_path(assigns(:trainer))
  end

  test "should render new on unsaved trainer" do
    post :create, :trainer => {name: nil, user_id: nil }
    assert_template "new"
  end

  test "should update trainer" do
    patch :update, id: @trainer.id, trainer: {name: "bill"}
    @trainer.save
    assert_redirected_to trainer_path(assigns(:trainer))
  end

  test "should render edit unless update successful" do
    patch :update, id: @trainer.id, trainer: {name: nil}
    assert_template "edit"
  end

  test "should get edit" do
    get :edit, id: @trainer.id
    assert_response :success
    assert_template "edit"
  end

  test "should get show" do
    get :show, id: @trainer.id
    assert_response :success
  end

  test "should get a programs athletes" do
    get :show, id: @trainer.id
    assert_response :success
    @athletes = @program.athletes
    assert_not_nil @athletes
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil(:trainers)
  end

  test "should delete a trainer" do
    delete :destroy, id: @trainer.id
    @trainer.delete
    assert_redirected_to root_path
  end

#  test "should assign an athlete to a trainer" do
#    put :assign_trainer, athlete_id: @athlete.id, trainer_id: @trainer.id
#    @athlete.trainer_id = @trainer.id
#    assert_not_nil @athlete.trainer_id
#    assert_redirected_to trainer_athletes_path(assigns(:trainer))
#  end

  test "should get trainer_athletes" do
    get :trainer_athletes, id: @trainer.id
    assert_response :success
    assert_template "trainer_athletes"
  end

  # test "should get back_button" do
  #   get :back_button
  #   assert_response :success
  # end

end
