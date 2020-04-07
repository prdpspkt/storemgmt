
# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
#
@tr_date = "2076-04-01"
puts "Creating office..."
@office = Office::Office.new
@office.gov ="प्रदेश सरकार"
@office.ministry ="भौतिक पूर्वाधार विकास मन्त्रालय"
@office.department = ""
@office.office = "खानेपानी तथा सरसफाई डिभिजन कार्यालय"
@office.address = "तनहुँ गण्डकी प्रदेश"
@office.user_id = 1
@office.has_project_access = true
@office.save
puts "Completed..."
puts "Creating user ...."
@user = User.new
@user.email = 'prdpspkt@gmail.com'
@user.password = '123456'
@user.is_admin = true
@user.name = "Pradeep Sapkota"
@user.office_id = @office.id
@user.save

@office.user_id = @user.id
@office.save
puts "Completed..."

puts "Creating Fiscal Year...."
@fiscal_year = Office::FiscalYear.new
@fiscal_year.fy = "०७६/७७"
@fiscal_year.office_id = @office.id
@fiscal_year.save

@active_fiscal_year = Office::ActiveFiscalYear.new
@active_fiscal_year.fiscal_year_id = @fiscal_year.id
@active_fiscal_year.office_id = @office.id
@active_fiscal_year.save
puts "Completed"

puts "Creating sample Personnels"
@person1 = Office::Personnel.new
@person1.name_en = "Ramchandra Pandit"
@person1.name_ne = "रामचन्द्र पण्डित"
@person1.post = "Officer"
@person1.office_id = @office.id
@person1.user_id = @user.id
@person1.fiscal_year_id = @fiscal_year.id
@person1.level_class = "6th Level Officer"
@person1.save


@person1 = Office::Personnel.new
@person1.name_en = "Hari Prasad Timilsina"
@person1.name_ne = "हरि प्रसाद तिमिल्सिना"
@person1.post = "कार्यालय प्रमुख"
@person1.office_id = @office.id
@person1.user_id = @user.id
@person1.fiscal_year_id = @fiscal_year.id
@person1.level_class = "9th Level Officer"
@person1.save

@person1 = Office::Personnel.new
@person1.name_en = "Bamdev Paudel"
@person1.name_ne = "बामदेव पौडेल"
@person1.post = "इन्जिनियर"
@person1.office_id = @fiscal_year.id
@person1.user_id = @user.id
@person1.fiscal_year_id = @fiscal_year.id
@person1.level_class = "8th Level Officer"
@person1.save
 puts "Completed..."

puts "Creating control body..."
@store_body = Office::StoreBody.new
@store_body.office_id = @office.id
@store_body.fiscal_year_id = @fiscal_year.id
@store_body.user_id = @user.id
@store_body.office_chief_name = "हरि प्रसाद तिमिल्सिना"
@store_body.office_chief_degination = "डिभिजन प्रमुख"
@store_body.store_keeper_name = "रामचन्द्र पण्डित"
@store_body.office_chief_degination = "अधिकृत"
@store_body.save

puts "Completed..."

puts "Creating projects.."

spreadsheet = Roo::Excelx.new("#{Rails.root}/db/data/projects.xlsx")
header = spreadsheet.row(1)
projects = (2..spreadsheet.last_row).map do |i|
  row = Hash[[header, spreadsheet.row(i)].transpose]
  project = Project::Project.find_by_id(row["id"]) || Project::Project.new
  begin
    project.attributes = row.to_hash
  rescue Exception => error
    puts error.message
  end
  project.office_id = @office.id
  project.user_id = @user.id
  if project.valid?
    project.save!
  end
end
puts "Completed..."

puts "Creating Project Item Categories"
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
  category.office_id = @office.id
  category.user_id = @user.id
  if category.valid?
    category.save!
  end
end
puts "Completed..."

puts "Started Project Item Import"

@pitems47 = Project::Item.where(user_id: @user.id)
                .where(office_id: @office.id)
                .where(item_classification_no: 47)
if @pitems47.count > 0
  @item_register_page_no47 = @pitems47.last.item_register_page_no + 1
else
  @item_register_page_no47 = 1
end

@pitems52 = Project::Item.where(user_id: @user.id)
                .where(office_id: @office.id)
                .where(item_classification_no: 52)
if @pitems52.count > 0
  @item_register_page_no52 = @pitems52.last.item_register_page_no + 1
else
  @item_register_page_no52 = 1
end

def get_category temp_id
  Project::ItemCategory.find_by_temp_id(temp_id)
end

spreadsheet = Roo::Excelx.new("#{Rails.root}/db/data/items.xlsx")
header = spreadsheet.row(1)
(2..spreadsheet.last_row).map do |i|
  row = Hash[[header, spreadsheet.row(i)].transpose]
  item = Project::Item.find_by_id(row["id"]) || Project::Item.new
  category = get_category(row["temp_cat_id"])
  item.item_category_id = category.id
  item.unit_ne = category.unit_ne
  item.unit_en = category.unit_en
  item.temp_id = row["temp_id"]
  item.name_of_item_ne = row["name_of_item_ne"]
  item.name_of_item_en = row["name_of_item_en"]
  item.item_classification_no = row["item_classification_no"]
  item.office_id = @office.id
  item.user_id = @user.id
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


def get_project_id old_project_id
  Project::Project.where(office_id: @office.id)
      .where(user_id: @user.id).where(temp_id: old_project_id).first.id
end

def get_item_id old_item_id
  Project::Item.where(office_id: @office.id)
      .where(user_id: @user.id).where(temp_id: old_item_id).first.id
end

@project_item_register_page_no = 0
@prev_project_id = 0
def create_project_item project_id, item_id
  project_items = Project::ProjectItem.where(office_id: @office.id)
                      .where(user_id: @user.id)
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
    project_item.item_category_id = item.item_category_id
    if project_id == @prev_project_id
      @project_item_register_page_no = @project_item_register_page_no + 1
    else
      @project_item_register_page_no = 1
    end
    project_item.item_register_page_no = @project_item_register_page_no
    project_item.save!
  end
  @prev_project_id = project_id
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
  tr.fiscal_year_id = @fiscal_year.id
  tr.office_id = @office.id
  tr.user_id = @user.id
  tr.quantity = row["quantity"]
  tr.sku = row["quantity"]
  tr.rate = row["rate"]
  tr.amount = row["amount"]
  tr.transaction_type = 1
  tr.transaction_date= @tr_date
  tr.remarks = "अघिल्लो आ.व.को मौज्दातबाट अल्या"
  tr.save!
end

puts "Completed..."





