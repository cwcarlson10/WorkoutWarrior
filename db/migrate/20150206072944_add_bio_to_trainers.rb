class AddBioToTrainers < ActiveRecord::Migration
  def change
    add_column :trainers, :bio, :text
  end
end
