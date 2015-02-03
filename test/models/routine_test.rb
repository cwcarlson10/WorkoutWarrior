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

  # Can't do this validation - programs need valid routines
  # which need a valid program -> circular dependency
=begin
  test "Routine should have a program associated" do
    @routine.program = nil
    assert_not @routine.valid?
    @routine.program = @program
    assert @routine.valid?
  end
=end
end
