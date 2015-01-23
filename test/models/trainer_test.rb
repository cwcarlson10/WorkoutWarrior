require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @athlete_user = users(:athlete)
    @trainer_user = users(:trainer)

  end

  test "trainer should have a user_id" do
    assert @athlete.valid?
    @athlete.user_id = nil
    assert_not @athlete.valid?
  end

  test "trainer should have a name" do
    assert @athlete.valid?
    @athlete.name = nil
    assert_not @athlete.valid?
  end

  test "trainer's user should have a role of trainer" do
    assert_not @bad_athlete.valid?
    assert @athlete.valid?
  end
end
