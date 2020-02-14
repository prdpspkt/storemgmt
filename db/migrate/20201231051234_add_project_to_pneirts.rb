class AddProjectToPneirts < ActiveRecord::Migration[5.2]
  def change
    add_column :pneirts, :project_id, :integer
  end
end
