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
  binding.pry
  @item_register_page_no52 = @pitems52.last.item_register_page_no + 1
else
  @item_register_page_no52 = 1
end

def get_category_id temp_id
  Project::ItemCategory.find_by_temp_id(temp_id).id
end

spreadsheet = Roo::Excelx.new("#{Rails.root}/db/data/items.xlsx")
header = spreadsheet.row(1)
items = (2..spreadsheet.last_row).map do |i|
  row = Hash[[header, spreadsheet.row(i)].transpose]
  item = Project::Item.find_by_id(row["id"]) || Project::Item.new
  item.item_category_id = get_category_id(row["temp_cat_id"])
  item.temp_id = row["temp_id"]
  item.name_of_item_ne = row["name_of_item_ne"]
  item.name_of_item_en = row["name_of_item_en"]
  item.item_classification_no = row["item_classification_no"]
  if item.item_classification_no == 47
    item.item_register_page_no = @item_register_page_no47
    @item_register_page_no47 = @item_register_page_no47 + 1
  end
  if item.item_classification_no == 52
    item.item_register_page_no = @item_register_page_no52
    @item_register_page_no52 = @item_register_page_no52 + 1
  end
  item.office_id = @office_id
  item.user_id = @user_id
  item
end

begin
  if items.map(&:valid?).all?
    items.each(&:save!)
  end
rescue Exception => error
  binding.pry
end
