class AddEntryNoToOneirts < ActiveRecord::Migration[5.2]
  def change
    add_column :oneirts, :entry_no, :integer
  end
end
