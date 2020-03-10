class AddDemandIdToOfficeReleases < ActiveRecord::Migration[5.2]
  def change
    add_column :office_releases, :demand_id, :integer
  end
end
