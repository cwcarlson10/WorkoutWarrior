class CreateRoutines < ActiveRecord::Migration
  def change
    create_table :routines do |t|
      t.integer :sets
      t.integer :reps
      t.text :instructions
      t.string :duration
      t.references :exercise, index: true
      t.references :program, index: true

      t.timestamps
    end
  end
end
