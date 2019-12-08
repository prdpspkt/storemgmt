class AddMarkedAsFinalToOfficeReleases < ActiveRecord::Migration[5.2]
  def change
    add_column :office_releases, :marked_as_final, :boolean
  end
end
