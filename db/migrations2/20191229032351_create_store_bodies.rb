class CreateStoreBodies < ActiveRecord::Migration[5.2]
  def change
    create_table :store_bodies do |t|
      t.string :office_chief
      t.string :office_chief_degination
      t.string :section_chief
      t.string :section_chief_degination
      t.string :store_keeper_designation
      t.string :store_keeper_name
      t.boolean :status
      t.integer :office_id
      t.integer :fiscal_year_id

      t.timestamps
    end
  end
end
