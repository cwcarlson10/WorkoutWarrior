require 'test_helper'

class AthleteTest < ActiveSupport::TestCase
  def setup
    @athlete_user = users(:athlete)
    @athlete = Athlete.create(name: "Test User", user_id: @athlete_user.id)
    @trainer_user = users(:trainer)
    @bad_athlete = Athlete.create(name: "Bad Test User", user_id: @trainer_user.id)
  end

  test "athlete should have a user_id" do
    assert @athlete.valid?
    @athlete.user_id = nil
    assert_not @athlete.valid?
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
