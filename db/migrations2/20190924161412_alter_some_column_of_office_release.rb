class AlterSomeColumnOfOfficeRelease < ActiveRecord::Migration[5.2]
  def change
    rename_column :office_releases, :office_cheif_name, :office_chief_name
    rename_column :office_releases, :office_cheif_signed_date, :office_chief_signed_date
  end
end
