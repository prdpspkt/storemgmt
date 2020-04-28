class AlterColumnOfProjectReleases < ActiveRecord::Migration[5.2]
  def change
  	rename_column :project_releases, :store_chief_signed_date, :store_keeper_signed_date
  end
end
