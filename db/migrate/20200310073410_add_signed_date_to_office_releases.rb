class AddSignedDateToOfficeReleases < ActiveRecord::Migration[5.2]
  def change
    add_column :office_releases, :store_keeper_signed_date, :datetime
    add_column :office_releases, :office_chief_signed_date, :datetime
  end
end
