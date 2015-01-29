class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.boolean :completed
      t.datetime :completed_at
      t.text :feedback
      t.references :program, index: true
      t.references :athlete, index: true

      t.timestamps
    end
  end
end
