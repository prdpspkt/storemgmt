# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
#
# @tr_date = "2076-04-01"
#
# @user = User.new
# @user.email = 'prdpspkt@gmail.com'
# @user.password = '12345678'
# @user.is_admin = true
# @user.name = "Pradeep Sapkota"
# @user.save!
#
# puts "Completed..."
# puts "Creating user ...."
# @user = User.new
# @user.email = 'wss.tanahun.nawalpur@gmail.com'
# @user.password = '12345678'
# @user.is_admin = false
# @user.name = "Ramchandra Pandit"
# @user.save!
#
# puts "Completed..."
#
# puts "Creating office..."
# @office = Office::Office.new
# @office.gov = "प्रदेश सरकार"
# @office.ministry = "भौतिक पूर्वाधार विकास मन्त्रालय"
# @office.department = ""
# @office.office = "खानेपानी तथा सरसफाई डिभिजन कार्यालय"
# @office.address = "तनहुँ गण्डकी प्रदेश"
# @office.has_project_access = true
# @office.user_id = @user.id
# @office.save!
#
# @user.office_id = @office.id
# @user.save!
#
#
#
# puts "Creating Fiscal Year...."
# @fiscal_year = Office::FiscalYear.new
# @fiscal_year.fy = "०७६/७७"
# @fiscal_year.office_id = @office.id
# @fiscal_year.user_id = @user.id
# @fiscal_year.start_date = '2076-04-01'
# @fiscal_year.closing_date = '2077-03-31'
# @fiscal_year.status = false
# @fiscal_year.save!
#
# @active_fiscal_year = Office::ActiveFiscalYear.new
# @active_fiscal_year.fiscal_year_id = @fiscal_year.id
# @active_fiscal_year.office_id = @office.id
# @active_fiscal_year.user_id = @user.id
# @active_fiscal_year.save!
# puts "Completed"
#
# puts "Creating sample Personnels"
# @person1 = Office::Personnel.new
# @person1.name_en = "Ramchandra Pandit"
# @person1.name_ne = "रामचन्द्र पण्डित"
# @person1.post = "Officer"
# @person1.office_id = @office.id
# @person1.user_id = @user.id
# @person1.fiscal_year_id = @fiscal_year.id
# @person1.level_class = "6th Level Officer"
# @person1.working = true
# @person1.save!
#
#
# @person1 = Office::Personnel.new
# @person1.name_en = "Hari Prasad Timilsina"
# @person1.name_ne = "हरि प्रसाद तिमिल्सिना"
# @person1.post = "कार्यालय प्रमुख"
# @person1.office_id = @office.id
# @person1.user_id = @user.id
# @person1.working = true
# @person1.fiscal_year_id = @fiscal_year.id
# @person1.level_class = "9th Level Officer"
# @person1.save!
#
# @person1 = Office::Personnel.new
# @person1.name_en = "Indra Pratap Bohara"
# @person1.name_ne = "इन्द्रप्रताप बोहरा"
# @person1.post = "इन्जिनियर"
# @person1.office_id = @office.id
# @person1.user_id = @user.id
# @person1.working = true
# @person1.fiscal_year_id = @fiscal_year.id
# @person1.level_class = "8th Level Officer"
# @person1.save!
# puts "Completed..."
#
# puts "Creating control body..."
# @store_body = Office::StoreBody.new
# @store_body.office_id = @office.id
# @store_body.fiscal_year_id = @fiscal_year.id
# @store_body.user_id = @user.id
# @store_body.office_chief_name = "हरि प्रसाद तिमिल्सिना"
# @store_body.office_chief_designation = "डिभिजन प्रमुख"
# @store_body.store_keeper_name = "रामचन्द्र पण्डित"
# @store_body.store_keeper_designation = "अधिकृत"
# @store_body.section_chief_designation = "इन्जिनियर"
# @store_body.section_chief_name = "इन्द्रप्रताप बोहरा"
# @store_body.save!
#
# puts "Completed..."
#
# @setup = Setup.new
# @setup.user_id = @user.id
# @setup.office = true
# @setup.fiscal_year = true
# @setup.active_fiscal_year = true
# @setup.store_body = true
# @setup.complete = true
# @setup.save!
#
# puts "Creating Office Item Categories...."
# spreadsheet = Roo::Excelx.new("#{Rails.root}/db/data/office_item_categories.xlsx")
# header = spreadsheet.row(1)
# (2..spreadsheet.last_row).map do |i|
#   row = Hash[[header, spreadsheet.row(i)].transpose]
#   category = Office::ItemCategory.find_by_id(row["id"]) || Office::ItemCategory.new
#   begin
#     category.attributes = row.to_hash
#   rescue Exception => error
#     puts error.message
#   end
#   category.office_id = @office.id
#   category.user_id = @user.id
#   if category.valid?
#     category.save!
#   end
# end
# puts "Completed ... "
# puts "Creating Office Items"
#
# def get_office_cat temp_cat_id
#   @cat = Office::ItemCategory.find_by_temp_id(temp_cat_id)
#   if @cat.blank?
#     binding.pry
#   end
#   @cat
# end
#
# def create_office_pool_item item
#   pool_item = Office::PoolItem.new(item.attributes.select { |key, _| Office::PoolItem.column_names.include? key })
#   pool_item.id = nil
#   pool_item.save
#   pool_item
# end
#
# @item_register_page_no = 1
# spreadsheet = Roo::Excelx.new("#{Rails.root}/db/data/office_items.xlsx")
# header = spreadsheet.row(1)
# (2..spreadsheet.last_row).map do |i|
#   row = Hash[[header, spreadsheet.row(i)].transpose]
#   item = Office::Item.find_by_id(row["id"]) || Office::Item.new
#   begin
#     item.attributes = row.to_hash
#   rescue Exception => error
#     puts error.message
#   end
#   category = get_office_cat item.temp_cat_id
#   item.item_category_id = category.id
#   item.unit_ne = category.unit_ne
#   item.unit_en = category.unit_en
#   item.office_id = @office.id
#   item.user_id = @user.id
#   if item.item_classification_no == 407
#     item.fiscal_year_id = @fiscal_year.id
#   end
#   item.item_register_page_no = @item_register_page_no
#   item.pool_item_id = create_office_pool_item(item).id
#   if item.valid?
#     item.save!
#     @item_register_page_no = @item_register_page_no + 1
#   end
# end
#
# puts "Completed..."
# puts "Importing last year balance"
#
# def get_office_item_id temp_id
#   Office::Item.find_by_temp_id(temp_id).id
# end
#
# spreadsheet = Roo::Excelx.new("#{Rails.root}/db/data/office_transactions.xlsx")
# header = spreadsheet.row(1)
# (2..spreadsheet.last_row).map do |i|
#   row = Hash[[header, spreadsheet.row(i)].transpose]
#   item = Office::ItemTransaction.find_by_id(row["id"]) || Office::ItemTransaction.new
#   begin
#     item.attributes = row.to_hash
#   rescue Exception => error
#     puts error.message
#   end
#   item.transaction_type = 1
#   item.item_classification_no = 408
#   item.office_id = @office.id
#   item.amount = item.rate * item.quantity
#   item.item_id = get_office_item_id item.temp_item_id
#   item.user_id = @user.id
#   item.sku = item.quantity
#   item.store_body_id = @store_body.id
#   # if item.valid?
#   item.save!
#   # end
# end
#
#
# puts "Creating projects.."
#
# spreadsheet = Roo::Excelx.new("#{Rails.root}/db/data/projects.xlsx")
# header = spreadsheet.row(1)
# (2..spreadsheet.last_row).map do |i|
#   row = Hash[[header, spreadsheet.row(i)].transpose]
#   project = Project::Project.new
#   begin
#     project.attributes = row.to_hash
#   rescue Exception => error
#     puts error.message
#   end
#   project.office_id = @office.id
#   project.user_id = @user.id
#   if project.valid?
#     project.save!
#   else
#     binding.pry
#   end
# end
# puts "Completed..."
#
# puts "Creating Project Item Categories"
# spreadsheet = Roo::Excelx.new("#{Rails.root}/db/data/project_item_categories.xlsx")
# header = spreadsheet.row(1)
# (2..spreadsheet.last_row).map do |i|
#   row = Hash[[header, spreadsheet.row(i)].transpose]
#   category = Project::ItemCategory.find_by_id(row["id"]) || Project::ItemCategory.new
#   begin
#     category.attributes = row.to_hash
#   rescue Exception => error
#     puts error.message
#   end
#   category.office_id = @office.id
#   category.user_id = @user.id
#   if category.valid?
#     category.save!
#   end
# end
# puts "Completed..."
#
# puts "Started Project Item Import"
#
# @pitems408 = Project::Item.where(user_id: @user.id)
#                 .where(office_id: @office.id)
#                 .where(item_classification_no: 408)
# if @pitems408.count > 0
#   @item_register_page_no408 = @pitems408.last.item_register_page_no + 1
# else
#   @item_register_page_no408 = 1
# end
#
# @pitems407 = Project::Item.where(user_id: @user.id)
#                 .where(office_id: @office.id)
#                 .where(item_classification_no: 407)
# if @pitems407.count > 0
#   @item_register_page_no407 = @pitems407.last.item_register_page_no + 1
# else
#   @item_register_page_no407 = 1
# end
#
# def get_category temp_id
#   Project::ItemCategory.find_by_temp_id(temp_id)
# end
#
# spreadsheet = Roo::Excelx.new("#{Rails.root}/db/data/project_items.xlsx")
# header = spreadsheet.row(1)
# puts header
# (2..spreadsheet.last_row).map do |i|
#   row = Hash[[header, spreadsheet.row(i)].transpose]
#   item = Project::Item.find_by_id(row["id"]) || Project::Item.new
#   category = get_category(row["temp_cat_id"])
#   item.item_category_id = category.id
#   item.unit_ne = category.unit_ne
#   item.unit_en = category.unit_en
#   item.temp_id = row["temp_id"]
#   item.name_of_item_ne = row["name_of_item_ne"]
#   item.name_of_item_en = row["name_of_item_en"]
#   item.item_classification_no = row["item_classification_no"]
#   item.office_id = @office.id
#   item.user_id = @user.id
#   if item.item_classification_no == 408
#     item.item_register_page_no = @item_register_page_no408
#     @item_register_page_no408 = @item_register_page_no408 + 1
#     if item.valid?
#       item.save!
#     else
#       binding.pry
#     end
#   end
#   if item.item_classification_no == 407
#     item.item_register_page_no = @item_register_page_no407
#     @item_register_page_no407 = @item_register_page_no407 + 1
#     if item.valid?
#       item.save!
#     else
#       binding.pry
#     end
#   end
# end
#
# puts "completed..."
#---- TO DO Comment ----
@office = Office::Office.find(1)
@user = User.find(2)
@fiscal_year = Office::FiscalYear.find(1)
#----- TO DO END ------

puts "Copying last year stock balance..."


def get_project_id old_project_id
  Project::Project.where(office_id: @office.id).where(temp_id: old_project_id).first.id
end

def get_item_id old_item_id
  begin
  Project::Item.where(office_id: @office.id).where(temp_id: old_item_id).first.id
rescue Exception => ex
  puts ex.message
  binding.pry
end
end

@project_item_register_page_no = 0
@prev_project_id = 0

def create_project_item project_id, item_id
  project_items = Project::ProjectItem.where(office_id: @office.id)
                      .where(user_id: @user.id)
                      .where(project_id: project_id)
                      .where(fiscal_year_id: @fiscal_year.id)
                      .where(item_id: item_id)
  if project_items.count > 0
    project_item = project_items.last
  else
    item = Project::Item.find(item_id)
    project_item = Project::ProjectItem.new(item.attributes.select { |key, _| Project::ProjectItem.column_names.include? key })
    project_item.id = nil
    project_item.item_id = item_id
    project_item.project_id = project_id
    project_item.office_id = @office.id
    project_item.item_classification_no = item.item_classification_no
    project_item.user_id = @user.id
    project_item.fiscal_year_id = @fiscal_year.id
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

spreadsheet = Roo::Excelx.new("#{Rails.root}/db/data/project_item_transactions.xlsx")
header = spreadsheet.row(1)
(2..spreadsheet.last_row).map do |i|
  row = Hash[[header, spreadsheet.row(i)].transpose]
  tr = Project::ProjectItemTransaction.new
  tr.item_id = get_item_id row["old_item_id"]
  tr.project_id = get_project_id row["old_project_id"]
  project_item = create_project_item(tr.project_id, tr.item_id)
  tr.project_item_id = project_item.id
  tr.item_classification_no = project_item.item_classification_no
  tr.fiscal_year_id = @fiscal_year.id
  tr.office_id = @office.id
  tr.user_id = @user.id
  tr.quantity = row["quantity"]
  tr.sku = row["quantity"]
  tr.rate = row["rate"]
  tr.amount = row["amount"]
  tr.transaction_type = 1
  tr.transaction_date = @tr_date
  tr.remarks = "अघिल्लो आ.व.को मौज्दातबाट अल्या"
  tr.save!
end

puts "Completed..."





