require 'rails_helper'

RSpec.describe "it should check models", :type => :model do
  it "should require a username" do
    Program.new(:name => "").should_not be_valid
  end
end
