class RemoveTrainerFromAthletes < ActiveRecord::Migration
  def change
    remove_column :athletes, :trainer, :string
  end
end
