spreadsheet = Roo::Excelx.new("#{Rails.root}/db/data/project_item_categories.xlsx")
header = spreadsheet.row(1)
(2..spreadsheet.last_row).map do |i|
  row = Hash[[header, spreadsheet.row(i)].transpose]
  category = Project::ItemCategory.find_by_id(row["id"]) || Project::ItemCategory.new
  begin
    category.attributes = row.to_hash
  rescue Exception => error
    puts error.message
  end
  category.office_id = current_office.id
  category.user_id = current_user.id
  if category.valid?
    category.save!
  end
end

