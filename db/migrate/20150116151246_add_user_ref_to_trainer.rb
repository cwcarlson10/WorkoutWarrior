class AddUserRefToTrainer < ActiveRecord::Migration
  def change
    add_reference :trainers, :user, index: true
  end
end
