class AddUserRefToPrograms < ActiveRecord::Migration
  def change
    add_reference :programs, :user, index: true
  end
end
