class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.text :text
      t.integer :created_for, default: 0
      t.datetime :end_date
      t.boolean :expired, default: false
      t.text :type

      t.timestamps
    end
  end
end
