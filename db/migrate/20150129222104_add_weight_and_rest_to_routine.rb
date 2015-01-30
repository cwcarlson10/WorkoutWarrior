class AddWeightAndRestToRoutine < ActiveRecord::Migration
  def change
    add_column :routines, :weight, :integer
    add_column :routines, :rest, :string
  end
end
