class RemoveCompletedFromActivities < ActiveRecord::Migration
  def change
    remove_column :activities, :completed, :boolean
  end
end
