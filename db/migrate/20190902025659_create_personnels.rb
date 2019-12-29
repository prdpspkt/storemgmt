class CreatePersonnels < ActiveRecord::Migration[5.2]
  def change
    create_table :'personnels' do |t|
      t.string :name_ne
      t.string :name_en
      t.string :post
      t.string :phone
      t.string :address
      t.string :level_class
      t.string :service
      t.string :group
      t.string :sub_group
      t.string :ctroll

      t.timestamps
    end
  end
end
