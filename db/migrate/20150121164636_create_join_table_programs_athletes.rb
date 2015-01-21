class CreateJoinTableProgramsAthletes < ActiveRecord::Migration
  def change
    create_join_table :programs, :athletes do |t|
      t.index [:program_id, :athlete_id]
      t.index [:athlete_id, :program_id]
    end
  end
end
