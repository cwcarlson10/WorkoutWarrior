class CreateRoutines < ActiveRecord::Migration
  def change
    create_table :routines do |t|
      t.integer :sets
      t.integer :reps
      t.text :instructions
      t.string :duration
      t.exercise :resources
      t.program :resources

      t.timestamps
    end
  end
end
