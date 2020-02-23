class CreateOffices < ActiveRecord::Migration[5.2]
  def change
    create_table :offices do |t|
      t.string :gov
      t.string :ministry
      t.string :department
      t.string :office
      t.string :address
      t.string :phone
      t.string :fax
      t.string :email
      t.string :code
      t.integer :office_chief
      t.integer :section_chief
      t.integer :store_chief
      t.integer :user_id

      t.timestamps
    end
  end
end
