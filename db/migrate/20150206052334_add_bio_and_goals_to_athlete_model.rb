class AddBioAndGoalsToAthleteModel < ActiveRecord::Migration
  def change
    add_column :athletes, :bio, :text
    add_column :athletes, :goals, :string
  end
end
