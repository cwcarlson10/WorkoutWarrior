require 'test_helper'

class ProgramsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  def setup
    @user3 = User.create!(email: "c@mail.com", password: "password", password_confirmation: "password", role: "trainer")
    @user = User.create!(email: "a@mail.com", password: "password", password_confirmation: "password", role: "trainer")
    @user2 = User.create!(email: "b@mail.com", password: "password", password_confirmation: "password", role: "athlete")
    @trainer = Trainer.create!(name: "Joe", organization: "Monkeys", certifications: "One", user_id: @user.id)
    @athlete = Athlete.create!(name: "bart", user_id: @user2.id)
    @program = Program.create!(name: "first", trainer_id: @trainer.id)
  end

  test "it should get index" do
    sign_in @user
    @trainer = @user.trainer
    get :index
    assert_response :success
  end

  test "it should post create" do
    sign_in @user
    @trainer = @user.trainer
    post :create, athlete_ids: 1, program: { name: 'Program' }
    assert_response :redirect
      assert_redirected_to programs_path
  end

  test "it should get show" do
    sign_in @user
    @trainer = @user.trainer
    get :show, id: @program.id
    assert_response :success
  end

  test "it should update program" do
    sign_in @user
    @trainer = @user.trainer
    put :update, id: @program.id, program: { name: 'Program' }
    assert_response :redirect
      assert_redirected_to program_path(@program.id)
  end

  test 'should delete the program and redirect to programs path' do
    sign_in @user
    @trainer = @user.trainer
    assert_difference('Program.count', -1) do
      delete :destroy, id: Program.last.id
    end
    assert_response :redirect
      assert_redirected_to programs_path
  end

  test 'should verify athlete exists' do
    sign_in @user
    @trainer = @user.trainer
    get :program_athletes, id: @program.id
    assert_response :success
  end

end
