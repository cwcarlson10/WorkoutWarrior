class RemoveUseridFromPrograms < ActiveRecord::Migration
  def change
    remove_column :programs, :user_id, :integer
  end
end
