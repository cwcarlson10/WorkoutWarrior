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
end
