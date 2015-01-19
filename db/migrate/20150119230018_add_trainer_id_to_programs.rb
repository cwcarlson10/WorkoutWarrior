class AddTrainerIdToPrograms < ActiveRecord::Migration
  def change
    add_reference :programs, :trainer, index: true
  end
end
