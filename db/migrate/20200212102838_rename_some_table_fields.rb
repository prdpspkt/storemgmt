class RenameSomeTableFields < ActiveRecord::Migration[5.2]
  def change
    rename_column :peirts, :entry_no, :entry_release_no
    rename_column :pneirts, :entry_no, :entry_release_no
  end
end
