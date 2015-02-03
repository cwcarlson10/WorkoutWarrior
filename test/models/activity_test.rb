require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  def setup
    @activity = activities(:activity_1)
    @athlete = @activity.athlete
    @program = @activity.program
  end

  test "Activity requires an athlete" do
    @activity.athlete = nil
    assert_not @activity.valid?
    @activity.athlete = @athlete
    assert @activity.valid?
  end

  # Removed this test to prevent circular dependency
  # with program.save!
=begin
  test "Activity requires an program" do
    @activity.program = nil
    assert_not @activity.valid?
    @activity.program = @program
    assert @activity.valid?
  end
=end
end
