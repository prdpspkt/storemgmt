class CreateSetups < ActiveRecord::Migration[5.2]
  def change
    create_table :setups do |t|
      t.boolean :office
      t.boolean :fiscal_year
      t.boolean :active_fiscal_year
      t.boolean :store_body
      t.boolean :complete
      t.integer :user_id

      t.timestamps
    end
  end
end
