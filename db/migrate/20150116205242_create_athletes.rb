class CreateAthletes < ActiveRecord::Migration
  def change
    create_table :athletes do |t|
      t.string :name
      t.string :trainer
      t.references :user, index: true

      t.timestamps
    end
  end
end
