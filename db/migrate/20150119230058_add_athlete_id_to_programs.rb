class AddAthleteIdToPrograms < ActiveRecord::Migration
  def change
    add_reference :programs, :athlete, index: true
  end
end
