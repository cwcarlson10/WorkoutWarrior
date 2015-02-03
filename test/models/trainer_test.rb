require 'test_helper'

class TrainerTest < ActiveSupport::TestCase
  def setup
    @athlete_user = users(:athlete)
    @trainer_user = users(:trainer)
    @trainer = Trainer.new(name: "Test User", user_id: @trainer_user.id)
    @bad_trainer = Trainer.new(name: "Bad Test User", user_id: @athlete_user.id)
  end

  test "trainer should have a user_id" do
    assert @trainer.valid?
    @trainer.user_id = nil
    assert_not @trainer.valid?
  end

  test "trainer should have a name" do
    assert @trainer.valid?
    @trainer.name = nil
    assert_not @trainer.valid?
  end

  test "trainer's user should have a role of athlete" do
    assert_not @bad_trainer.valid?
    @bad_trainer.user.role = 'trainer'
    @bad_trainer.user.save
    assert @bad_trainer.valid?
  end
end
