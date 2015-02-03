require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @athlete = users(:athlete_user_1)
    @trainer = users(:trainer_user_1)
    @newuser = users(:newuser)
  end

  test "should not create user without email" do
    user = User.new(email: "",
                    password: "password")
    assert_not user.save
  end

  test "should not create user with blank password" do
    user = User.new(email: "an@ema.il")
    assert_not user.save
  end

  test "should not create user with password < 8 characters" do
    user = User.new(email: "an@ema.il", password: "passwor")
    assert_not user.save
  end

  test "should create user" do
    user = User.new(email: "an@ema.il", password: "password")
    assert user.save
  end

  test "role 0 should be new" do
    user = User.new(email: "an@ema.il", password: "password",
                    role: 0)
    assert user.save
    assert user.role == "newuser"
  end

  test "role 1 should be athlete" do
    user = User.new(email: "an@ema.il", password: "password",
                    role: 1)
    assert user.save
    assert user.role == "athlete"
  end

  test "role 2 should be trainer" do
    user = User.new(email: "an@ema.il", password: "password",
                    role: 2)
    assert user.save
    assert user.role == "trainer"
  end

  test "athlete should have athlete role" do
    assert @athlete.role == "athlete"
  end

  test "trainer should have trainer role" do
    assert @trainer.role == "trainer"
  end

  test "newuser should have newuser role" do
    assert @newuser.role == "newuser"
  end
end
