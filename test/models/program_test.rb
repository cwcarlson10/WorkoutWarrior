require 'test_helper'

class ProgramTest < ActiveSupport::TestCase
  def setup
    @program = programs(:program_1)
  end

  test "Program should have a name" do
    @program.name = nil
    assert_not @program.valid?
    @program.name = "Program Name"
    assert @program.valid?
  end

  test "Program should have a trainer" do
  end

  test "Program.routines should return an array" do
  end

  test "Program.exercises should return an array" do
  end
end
