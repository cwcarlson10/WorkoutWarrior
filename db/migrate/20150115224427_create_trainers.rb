class CreateTrainers < ActiveRecord::Migration
  def change
    create_table :trainers do |t|
      t.string :name
      t.string :organization
      t.string :certifications

      t.timestamps
    end
  end
end
