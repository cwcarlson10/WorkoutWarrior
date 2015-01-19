class AddTrainerIdToAthlete < ActiveRecord::Migration
  def change
    add_reference :athletes, :trainer, index: true
  end
end
