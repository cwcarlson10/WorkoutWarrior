require 'test_helper'

class AthleteTest < ActiveSupport::TestCase
  def setup
    @athlete = athletes(:athlete_1)
    @trainer_user = users(:trainer_user_1)
    @bad_athlete = Athlete.create(name: "Bad Test User", user_id: @trainer_user.id)
  end

  test "athlete should have a user_id" do
    assert @athlete.valid?, "Fixture athlete was invalid."
    @athlete.user_id = nil
    assert_not @athlete.valid?, "Athlete was valid with no user_id."
  end

  test "athlete should have a name" do
    assert @athlete.valid?
    @athlete.name = nil
    assert_not @athlete.valid?
  end

  test "athlete's user should have a role of athlete" do
    assert_not @bad_athlete.valid?
    assert @athlete.valid?
  end
end
