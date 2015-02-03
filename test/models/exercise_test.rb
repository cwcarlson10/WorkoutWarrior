require 'test_helper'

class ExerciseTest < ActiveSupport::TestCase
  def setup
    @exercise = Exercise.new(title: "Exercise Title",
                             description: "Exercise Description")
  end

  test "An exercise should have a title" do
    @exercise.title = nil
    assert_not @exercise.valid?
    @exercise.title = "Exercise Title"
    assert @exercise.valid?
  end

  test "An exercise should have a description" do
    @exercise.description = nil
    assert_not @exercise.valid?
    @exercise.description = "Exercise Description"
    assert @exercise.valid?
  end

  test "The exercise model should initialize @categories" do
    @categories = Exercise.categories
    assert @categories.is_a?(Array)
    assert @categories.count > 0
  end
end
