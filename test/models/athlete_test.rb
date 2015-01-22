require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @athlete_user = users(:athlete)
    @athlete = Athlete.create(name: "Test User", user_id: @athlete_user.id)
    @trainer_user = users(:trainer)
    @bad_athlete = Athlete.create(name: "Bad Test User", user_id: @trainer_user.id)
  end

  test "athlete should have a user_id" do
    assert_not @athlete.user_id.nil?
  end

  test "athlete should have a name" do
    assert_not @athlete.name.nil?
  end

  test "athlete's user should have a role of athlete" do
    assert_not Athlete.create(name: "Bad Test User", user_id: @trainer_user.id)

  end
end
