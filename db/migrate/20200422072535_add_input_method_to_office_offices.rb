class AddInputMethodToOfficeOffices < ActiveRecord::Migration[5.2]
  def change
    add_column :office_offices, :input_system, :string
  end
end
