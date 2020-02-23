class AlterNameOfContractorFieldToProjects < ActiveRecord::Migration[5.2]
  def change
    rename_column :projects, :phone_of_contrator_representative, :phone_of_contractor_representative
  end
end
