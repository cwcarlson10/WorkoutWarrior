require 'test_helper'

class RoutineTest < ActiveSupport::TestCase
  def setup
    @routine = Routine.new
    @exercise = Exercise.first
    @program = Program.first
    @routine.exercise = @exercise
    @routine.program = @program
  end

  test "Routine should have an exercise associated" do
    @routine.exercise = nil
    assert_not @routine.valid?
    @routine.exercise = @exercise
    assert @routine.valid?
  end

  test "Routine should have a program associated" do
    @routine.program = nil
    assert_not @routine.valid?
    @routine.program = @program
    assert @routine.valid?
  end
end
