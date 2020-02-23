class AddSpecificationToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :specification, :string
  end
end
