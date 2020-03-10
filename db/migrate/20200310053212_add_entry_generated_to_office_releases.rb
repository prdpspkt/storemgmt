class AddEntryGeneratedToOfficeReleases < ActiveRecord::Migration[5.2]
  def change
    add_column :office_releases, :entry_generated, :boolean
  end
end
