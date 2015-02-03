require 'test_helper'

class ProgramTest < ActiveSupport::TestCase
  def setup
    @program = programs(:program_1)
    @trainer = @program.trainer
    @name = @program.name
  end

  test "Program should have a name" do
    @program.name = nil
    assert_not @program.valid?
    @program.name = @name
    assert @program.valid?
  end

  test "Program should have a trainer" do
    @program.trainer = nil
    assert_not @program.valid?
    @program.trainer = @trainer
    assert @program.valid?
  end

  test "Program.routines should return an array" do
    assert @program.routines.is_a?(ActiveRecord::Associations::CollectionProxy)
  end

  test "Program.exercises should return an array" do
    assert @program.exercises.is_a?(ActiveRecord::Associations::CollectionProxy)
  end
end
