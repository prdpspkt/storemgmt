class AddReleasedFromToOfficeReleaseItems < ActiveRecord::Migration[5.2]
  def change
    add_column :office_release_items, :released_from, :integer
  end
end
