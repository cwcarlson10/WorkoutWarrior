require 'rails_helper'

RSpec.describe "it should check models", :type => :model do
  it "should require a name" do
    program = Program.new(:name => "")
    expect(program).not_to be_valid
  end

  it "should not allow characters except letters, numbers, and space", :type =>
  :model do
    program = Program.new(:name => "-")
    expect(program).not_to be_valid
  end

  it "should allow an alpha-numeric name with spaces", type: :model do
    program = Program.new(:name => "My Program 3")
    expect(program).to be_valid
  end

  it "should not allow trailing spaces in the name", type: :model do
    program = Program.new(:name => "My Program 3 ")
    expect(program).not_to be_valid
  end

  it "should not allow name to extend beyond 100 characters", type: :model do
    program = Program.new(:name => "a"*101)
    expect(program).not_to be_valid
  end
end
