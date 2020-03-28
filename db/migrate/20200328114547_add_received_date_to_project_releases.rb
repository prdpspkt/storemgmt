class AddReceivedDateToProjectReleases < ActiveRecord::Migration[5.2]
  def change
    add_column :project_releases, :received_date, :datetime
  end
end
