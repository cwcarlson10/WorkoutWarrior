class RemoveFieldFromPrograms < ActiveRecord::Migration
  def change
    remove_column :programs, :athlete_id
  end
end
