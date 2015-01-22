require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not create user without email" do
    user = User.new(email: "", password: "passwor",
                    password_confirmation: "passwor")
    assert_not user.save
  end

  test "should not create user with blank password" do
    user = User.new(email: "an@ema.il")
    assert_not user.save
  end

  test "should not create user without password confirmation" do
    user = User.new(email: "an@ema.il", password: "passwor")
    assert_not user.save
  end

  test "should not create user with password < 8 characters" do
    user = User.new(email: "an@ema.il", password: "passwor",
                    password_confirmation: "passwor")
    assert_not user.save
  end

  test "should create user" do
    user = User.new(email: "an@ema.il", password: "password",
                    password_confirmation: "password")
    assert user.save
  end

  test "role 0 should be new" do
    user = User.new(email: "an@ema.il", password: "password",
                    password_confirmation: "password", role: 0)
    assert user.save
    assert user.role == "newuser"
  end

  test "role 1 should be athlete" do
    user = User.new(email: "an@ema.il", password: "password",
                    password_confirmation: "password", role: 1)
    assert user.save
    assert user.role == "athlete"
  end

  test "role 2 should be trainer" do
    user = User.new(email: "an@ema.il", password: "password",
                    password_confirmation: "password", role: 2)
    assert user.save
    assert user.role == "trainer"
  end

  test "athlete should have athlete role" do
    user = User.where(role: 1).first
    assert user.role == "athlete"
  end
end
