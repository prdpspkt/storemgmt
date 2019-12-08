class AddEntryNoToOeirts < ActiveRecord::Migration[5.2]
  def change
    add_column :oeirts, :entry_no, :integer
  end
end
