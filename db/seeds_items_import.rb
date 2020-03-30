


puts "Started Item Import"

@office_id = 1
@user_id = 1
@fiscal_year_id = 1

@pitems47 = Project::Item.where(user_id: @user_id)
                .where(office_id: @office_id)
                .where(item_classification_no: 47)
if @pitems47.count > 0
  @item_register_page_no47 = @pitems47.last.item_register_page_no + 1
else
  @item_register_page_no47 = 1
end

@pitems52 = Project::Item.where(user_id: @user_id)
                .where(office_id: @office_id)
                .where(item_classification_no: 52)
if @pitems52.count > 0
  @item_register_page_no52 = @pitems52.last.item_register_page_no + 1
else
  @item_register_page_no52 = 1
end

def get_category_id temp_id
  Project::ItemCategory.find_by_temp_id(temp_id).id
end

spreadsheet = Roo::Excelx.new("#{Rails.root}/db/data/items.xlsx")
header = spreadsheet.row(1)
(2..spreadsheet.last_row).map do |i|
  row = Hash[[header, spreadsheet.row(i)].transpose]
  item = Project::Item.find_by_id(row["id"]) || Project::Item.new
  item.item_category_id = get_category_id(row["temp_cat_id"])
  item.temp_id = row["temp_id"]
  item.name_of_item_ne = row["name_of_item_ne"]
  item.name_of_item_en = row["name_of_item_en"]
  item.item_classification_no = row["item_classification_no"]
  item.office_id = @office_id
  item.user_id = @user_id
  if item.item_classification_no == 47
    item.item_register_page_no = @item_register_page_no47
    @item_register_page_no47 = @item_register_page_no47 + 1
    if item.valid?
      item.save!
    end
  end
  if item.item_classification_no == 52
    item.item_register_page_no = @item_register_page_no52
    @item_register_page_no52 = @item_register_page_no52 + 1
    if item.valid?
      item.save
    end
  end
end

puts "completed..."
puts "Copying last year stock balance..."
@tr_date = "2076-04-01"

def get_project_id old_project_id
  Project::Project.where(office_id: @office_id)
      .where(user_id: @user_id).where(temp_id: old_project_id).first.id
end

def get_item_id old_item_id
  Project::Item.where(office_id: @office_id)
      .where(user_id: @user_id).where(temp_id: old_item_id).first.id
end

def item_register_page_no project_id, item_id
  items = Project::ProjectItem.where(office_id: @office_id)
              .where(user_id: @user_id)
              .where(project_id: project_id)
              .where(item_id: item_id)
  register_page_no = 1
  if items.count > 0
    register_page_no = items.last.item_register_page_no + 1
  end
  register_page_no
end

def create_project_item project_id, item_id
  project_items = Project::ProjectItem.where(office_id: @office_id)
                      .where(user_id: @user_id)
                      .where(project_id: project_id)
                      .where(item_id: item_id)
  if project_items.count > 0
    project_item = project_items.last
  else
    item = Project::Item.find(item_id)
    project_item = Project::ProjectItem.new(item.attributes.select { |key, _| Project::ProjectItem.column_names.include? key })
    project_item.id = nil
    project_item.item_id = item_id
    project_item.project_id = project_id
    project_item.item_register_page_no = item_register_page_no(project_id, item_id)
    project_item.save!
  end
  project_item
end


spreadsheet = Roo::Excelx.new("#{Rails.root}/db/data/last_year_balance.xlsx")
header = spreadsheet.row(1)
(2..spreadsheet.last_row).map do |i|
  row = Hash[[header, spreadsheet.row(i)].transpose]
  tr = Project::ProjectItemTransaction.new
  tr.item_id = get_item_id row["old_item_id"]
  tr.project_id = get_project_id row["old_project_id"]
  tr.project_item_id = create_project_item(tr.project_id, tr.item_id).id
  tr.fiscal_year_id = @fiscal_year
  tr.office_id = @office_id
  tr.user_id = @user_id
  tr.quantity = row["quantity"]
  tr.rate = row["rate"]
  tr.amount = row["amount"]
  tr.transaction_type = 1
  tr.transaction_date= @tr_date
  tr.remarks = "अघिल्लो आ.व.को मौज्दातबाट अल्या"
  tr.save!
end

puts "Completed..."


