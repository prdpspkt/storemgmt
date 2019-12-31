# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_29_145655) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_fiscal_years", force: :cascade do |t|
    t.string "fy"
    t.integer "fiscal_year_id"
    t.integer "office_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "demand_items", force: :cascade do |t|
    t.string "name_of_item_ne"
    t.string "name_of_item_en"
    t.integer "office_item_id"
    t.string "specification"
    t.string "unit_ne"
    t.string "unit_en"
    t.decimal "quantity"
    t.decimal "amount"
    t.decimal "rate"
    t.string "remark"
    t.integer "demand_id"
    t.integer "user_id"
    t.integer "office_id"
    t.string "fy"
    t.integer "fiscal_year_id"
    t.integer "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "demands", force: :cascade do |t|
    t.integer "demand_no"
    t.datetime "demand_date"
    t.string "demand_by"
    t.string "recommended_by"
    t.datetime "recommended_date"
    t.boolean "needed_to_purchase"
    t.string "ordered_by"
    t.datetime "ordered_date"
    t.string "recorded_by"
    t.string "recorded_date"
    t.integer "user_id"
    t.integer "fiscal_year_id"
    t.integer "office_id"
    t.integer "item_id"
    t.boolean "marked_as_final"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fiscal_years", force: :cascade do |t|
    t.string "fy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "office_id"
    t.boolean "status"
  end

  create_table "item_assistance_register_items", force: :cascade do |t|
    t.datetime "date"
    t.integer "order_release_no"
    t.string "name_of_item_ne"
    t.string "name_of_item_en"
    t.string "specification"
    t.string "item_identification_no"
    t.string "model_no"
    t.decimal "quantity"
    t.decimal "amount"
    t.datetime "taken_date"
    t.datetime "date_to_be_returned"
    t.decimal "returned_quantity"
    t.datetime "returned_date"
    t.string "name_of_user"
    t.integer "user_id"
    t.integer "office_id"
    t.string "fy"
    t.integer "fiscal_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "item_assistance_register_id"
    t.integer "office_item_id"
  end

  create_table "item_assistance_registers", force: :cascade do |t|
    t.string "name_of_item_ne"
    t.string "name_of_item_en"
    t.string "unit_en"
    t.string "unit_ne"
    t.integer "register_page_no"
    t.integer "item_register_page_no"
    t.string "store_chief_name"
    t.string "store_chief_designation"
    t.datetime "store_chief_signed_date"
    t.string "office_chief_name"
    t.string "office_chief_designation"
    t.datetime "office_chief_signed_date"
    t.integer "user_id"
    t.integer "office_id"
    t.integer "office_item_id"
    t.integer "item_id"
    t.string "fy"
    t.integer "fiscal_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_categories", force: :cascade do |t|
    t.string "name_ne"
    t.string "name_en"
    t.string "unit_ne"
    t.string "unit_en"
    t.integer "user_id"
    t.integer "office_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_disposal_items", force: :cascade do |t|
    t.integer "item_classification_no"
    t.integer "item_register_page_no"
    t.integer "item_id"
    t.string "name_of_item_ne"
    t.string "name_of_item_en"
    t.string "unit_ne"
    t.boolean "is_office_item"
    t.boolean "is_project_item"
    t.string "specification"
    t.datetime "received_date"
    t.string "used_year"
    t.decimal "quantity"
    t.decimal "amount"
    t.decimal "current_marked_price"
    t.string "reason_for_disposal"
    t.string "remarks"
    t.integer "office_id"
    t.integer "user_id"
    t.string "fy"
    t.integer "fiscal_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_disposals", force: :cascade do |t|
    t.string "fy"
    t.datetime "decision_date"
    t.string "decision_made_by"
    t.string "store_chief_name"
    t.string "store_chief_designation"
    t.datetime "store_chief_signed_date"
    t.string "section_chief_name"
    t.string "section_chief_designation"
    t.datetime "section_chief_signed_date"
    t.string "office_chief_name"
    t.string "office_chief_designation"
    t.datetime "office_chief_signed_date"
    t.integer "office_id"
    t.integer "user_id"
    t.integer "fiscal_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name_of_item_ne"
    t.string "name_of_item_en"
    t.string "unit_ne"
    t.string "unit_en"
    t.integer "item_category_id"
    t.integer "office_id"
    t.integer "user_id"
    t.integer "item_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "specification"
    t.string "model_no"
    t.string "item_identification_no"
  end

  create_table "land_and_structure_record_book_items", force: :cascade do |t|
    t.string "district"
    t.string "local_level"
    t.integer "ward_no"
    t.string "map_sheet_no"
    t.string "plot_no"
    t.string "area"
    t.string "type"
    t.string "owner_name"
    t.string "certificate_no"
    t.datetime "received_date"
    t.decimal "price"
    t.decimal "structure_laying_land_area"
    t.decimal "structure_covered_area"
    t.string "structure_type"
    t.datetime "decision_date"
    t.decimal "structure_cost"
    t.decimal "land_and_structure_total_cost"
    t.datetime "evaluated_date"
    t.decimal "evaluated_price"
    t.string "remarks"
    t.integer "user_id"
    t.string "fy"
    t.integer "fiscal_year_id"
    t.integer "office_id"
    t.integer "land_and_structure_record_book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "land_and_structure_record_books", force: :cascade do |t|
    t.string "store_chief_name"
    t.string "store_chief_designation"
    t.datetime "store_chief_signed_date"
    t.string "office_chief_name"
    t.string "office_chief_designation"
    t.string "office_chief_signed_date"
    t.integer "user_id"
    t.string "fy"
    t.integer "fiscal_year_id"
    t.integer "office_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "oeirts", force: :cascade do |t|
    t.integer "office_item_id"
    t.integer "item_id"
    t.integer "office_id"
    t.integer "fiscal_year_id"
    t.integer "user_id"
    t.datetime "transaction_date"
    t.integer "transaction_type"
    t.decimal "rate"
    t.decimal "amount"
    t.decimal "quantity"
    t.string "remarks"
    t.integer "office_purchase_entry_item_id"
    t.decimal "sku"
    t.integer "office_release_item_id"
    t.integer "entry_no"
  end

  create_table "office_handover_form_items", force: :cascade do |t|
    t.integer "item_classification_no"
    t.integer "item_register_page_no"
    t.string "name_of_item_ne"
    t.string "name_of_item_en"
    t.string "specification"
    t.integer "item_identification_no"
    t.string "model_no"
    t.string "unit_ne"
    t.string "unit_en"
    t.decimal "quantity"
    t.decimal "amount"
    t.datetime "received_date"
    t.string "physical_status"
    t.string "fy"
    t.integer "fiscal_year_id"
    t.integer "user_id"
    t.integer "office_id"
    t.integer "project_id"
    t.integer "office_handover_form_id"
    t.integer "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "office_item_id"
    t.integer "handovered_from"
    t.string "country"
    t.string "size"
    t.string "age_approx"
    t.string "source"
  end

  create_table "office_handover_forms", force: :cascade do |t|
    t.datetime "decision_date"
    t.string "fy"
    t.integer "decision_no"
    t.string "handovered_office_name"
    t.datetime "date"
    t.integer "form_no"
    t.string "store_chief_name"
    t.string "store_chief_designation"
    t.datetime "store_chief_signed_date"
    t.string "office_chief_name"
    t.string "office_chief_designation"
    t.datetime "office_chief_signed_date"
    t.string "receiver_store_chief_name"
    t.string "receiver_store_chief_designation"
    t.datetime "receiver_store_chief_signed_date"
    t.string "receiver_chief_name"
    t.string "receiver_chief_desination"
    t.datetime "receiver_chief_signed_date"
    t.integer "office_id"
    t.integer "user_id"
    t.integer "fiscal_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "marked_as_final"
  end

  create_table "office_item_entries", force: :cascade do |t|
    t.integer "item_registration_page_no"
    t.integer "office_item_id"
    t.integer "item_id"
    t.decimal "rate"
    t.decimal "quantity"
    t.decimal "amount"
    t.integer "user_id"
    t.integer "office_id"
    t.integer "fiscal_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "office_item_evaluation_committees", force: :cascade do |t|
    t.integer "office_item_evaluation_id"
    t.string "name"
    t.string "designation"
    t.integer "user_id"
    t.integer "fiscal_year_id"
    t.integer "office_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "office_item_evaluation_items", force: :cascade do |t|
    t.integer "item_classification_no"
    t.integer "item_register_page_no"
    t.string "name_of_item_en"
    t.string "name_of_item_ne"
    t.string "unit_ne"
    t.string "unit_en"
    t.decimal "quantity"
    t.decimal "amount"
    t.decimal "mached"
    t.decimal "unmatched"
    t.decimal "decreased_quantity"
    t.decimal "increased_quantity"
    t.decimal "decreased_increased_quantity"
    t.decimal "working"
    t.decimal "notworking"
    t.decimal "to_be_repaired"
    t.decimal "to_be_auctioned"
    t.decimal "to_be_dispose"
    t.decimal "to_be_conserved"
    t.decimal "total_amount"
    t.string "remarks"
    t.integer "item_id"
    t.integer "office_item_id"
    t.integer "user_id"
    t.integer "office_id"
    t.string "fy"
    t.integer "fiscal_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "office_item_evaluations", force: :cascade do |t|
    t.string "office_code"
    t.string "fy"
    t.datetime "committee_formation_date"
    t.datetime "report_submission_date"
    t.integer "office_id"
    t.integer "user_id"
    t.integer "fiscal_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "office_item_stocks", force: :cascade do |t|
    t.decimal "quantity"
    t.decimal "rate"
    t.decimal "amount"
    t.integer "item_id"
    t.integer "office_item_id"
    t.integer "user_id"
    t.integer "office_id"
    t.integer "fiscal_year_id"
  end

  create_table "office_items", force: :cascade do |t|
    t.string "name_of_item_ne"
    t.string "name_of_item_en"
    t.string "specification"
    t.string "unit_ne"
    t.string "unit_en"
    t.integer "item_register_page_no"
    t.integer "item_classification_no"
    t.decimal "to_be_repaired"
    t.decimal "to_be_auctioned"
    t.decimal "to_be_conserved"
    t.decimal "working"
    t.decimal "not_working"
    t.integer "item_id"
    t.integer "user_id"
    t.integer "office_id"
    t.integer "fiscal_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "model_no"
    t.string "item_identification_no"
  end

  create_table "office_purchase_entries", force: :cascade do |t|
    t.datetime "entry_date"
    t.string "bill_no"
    t.integer "entry_no"
    t.string "store_chief_name"
    t.string "store_chief_designation"
    t.datetime "store_chief_signed_date"
    t.string "section_chief_name"
    t.string "section_chief_designation"
    t.datetime "section_chief_signed_date"
    t.string "office_chief_name"
    t.string "office_chief_designation"
    t.datetime "office_chief_signed_date"
    t.integer "user_id"
    t.integer "office_id"
    t.string "fy"
    t.boolean "marked_as_final"
    t.integer "fiscal_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "purchase_handover_no"
  end

  create_table "office_purchase_entry_items", force: :cascade do |t|
    t.integer "item_classification_no"
    t.integer "item_register_page_no"
    t.string "name_of_item_ne"
    t.string "name_of_item_en"
    t.string "specification"
    t.string "item_identification_no"
    t.string "model_no"
    t.string "unit_ne"
    t.string "unit_en"
    t.decimal "quantity"
    t.decimal "rate"
    t.decimal "amount_without_vat"
    t.decimal "vat"
    t.decimal "total_amount"
    t.decimal "other_expense"
    t.decimal "amount"
    t.string "remarks"
    t.integer "office_purchase_entry_id"
    t.integer "user_id"
    t.integer "office_id"
    t.string "fy"
    t.integer "item_id"
    t.integer "fiscal_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "office_item_id"
    t.string "country"
    t.string "size"
    t.string "approx_age"
    t.string "source"
    t.boolean "is_vatable"
  end

  create_table "office_release_items", force: :cascade do |t|
    t.string "name_of_item_ne"
    t.string "name_of_item_en"
    t.integer "item_register_page_no"
    t.string "code_no"
    t.string "specification"
    t.string "unit_ne"
    t.string "unit_en"
    t.decimal "quantity"
    t.decimal "rate"
    t.decimal "amount"
    t.string "remarks"
    t.integer "office_item_id"
    t.integer "office_release_id"
    t.integer "user_id"
    t.integer "office_id"
    t.integer "item_id"
    t.integer "fiscal_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "item_classification_no"
    t.integer "released_from"
  end

  create_table "office_releases", force: :cascade do |t|
    t.string "fy"
    t.integer "release_no"
    t.datetime "release_date"
    t.string "store_chief_name"
    t.datetime "store_chief_signed_date"
    t.string "office_chief_name"
    t.datetime "office_chief_signed_date"
    t.integer "user_id"
    t.integer "office_id"
    t.integer "fiscal_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "marked_as_final"
  end

  create_table "office_stock_items", force: :cascade do |t|
    t.integer "item_register_page_no"
    t.integer "item_classification_no"
    t.string "name_of_item_en"
    t.string "name_of_item_ne"
    t.string "unit_en"
    t.string "unit_ne"
    t.decimal "quantity"
    t.decimal "rate"
    t.decimal "amount"
    t.string "physical_status"
    t.string "remarks"
    t.integer "office_id"
    t.integer "office_item_id"
    t.integer "user_id"
    t.integer "fiscal_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "office_stocks", force: :cascade do |t|
    t.string "fy"
    t.string "store_chief_name"
    t.string "store_chief_designation"
    t.datetime "store_chief_sign_date"
    t.string "section_chief_name"
    t.string "section_chief_designation"
    t.datetime "section_chief_signed_date"
    t.string "office_chief_name"
    t.string "office_chief_designation"
    t.datetime "office_chief_signed_date"
    t.integer "office_id"
    t.integer "user_id"
    t.integer "fiscal_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offices", force: :cascade do |t|
    t.string "gov"
    t.string "ministry"
    t.string "department"
    t.string "office"
    t.string "address"
    t.string "phone"
    t.string "fax"
    t.string "email"
    t.string "code"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "oneirts", force: :cascade do |t|
    t.string "model"
    t.string "item_identification_no"
    t.string "country_of_origin"
    t.integer "office_item_id"
    t.integer "item_id"
    t.integer "office_id"
    t.integer "fiscal_year_id"
    t.integer "user_id"
    t.datetime "transaction_date"
    t.integer "transaction_type"
    t.decimal "rate"
    t.decimal "amount"
    t.decimal "quantity"
    t.integer "office_purchase_entry_item_id"
    t.string "remarks"
    t.decimal "sku"
    t.integer "office_release_item_id"
    t.integer "entry_no"
    t.string "country"
    t.string "size"
    t.string "approx_age"
    t.string "source"
    t.integer "office_handover_form_item_id"
  end

  create_table "peirts", force: :cascade do |t|
    t.integer "project_item_id"
    t.integer "item_id"
    t.integer "office_id"
    t.integer "project_id"
    t.integer "fiscal_year_id"
    t.integer "user_id"
    t.datetime "transaction_date"
    t.integer "transaction_type"
    t.decimal "rate"
    t.decimal "amount"
    t.decimal "quantity"
    t.string "remarks"
    t.integer "office_purchase_entry_item_id"
    t.decimal "sku"
    t.integer "project_release_item_id"
    t.integer "entry_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personnels", force: :cascade do |t|
    t.string "name_ne"
    t.string "name_en"
    t.string "post"
    t.string "phone"
    t.string "address"
    t.string "level_class"
    t.string "service"
    t.string "group"
    t.string "sub_group"
    t.string "ctroll"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "office_id"
    t.integer "user_id"
    t.integer "fiscal_year_id"
  end

  create_table "pneirts", force: :cascade do |t|
    t.string "model_no"
    t.string "item_identificaiton_no"
    t.string "country"
    t.integer "project_item_id"
    t.integer "item_id"
    t.integer "office_id"
    t.integer "user_id"
    t.integer "fiscal_year_id"
    t.datetime "transaction_date"
    t.integer "transaction_type"
    t.decimal "rate"
    t.decimal "amount"
    t.decimal "quantity"
    t.integer "project_purchase_entry_item_id"
    t.integer "breakdown_id"
    t.string "remarks"
    t.decimal "sku"
    t.integer "project_handover_form_id"
    t.integer "entry_no"
    t.string "size"
    t.string "approx_age"
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_demand_items", force: :cascade do |t|
    t.string "name_of_item_ne"
    t.string "name_of_item_en"
    t.string "specification"
    t.string "unit_ne"
    t.string "unit_en"
    t.decimal "quantity"
    t.decimal "amount"
    t.decimal "rate"
    t.string "remark"
    t.integer "user_id"
    t.integer "office_id"
    t.integer "project_id"
    t.integer "project_item_id"
    t.string "fy"
    t.integer "fiscal_year_id"
    t.integer "item_id"
    t.integer "project_demand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_demands", force: :cascade do |t|
    t.integer "demand_no"
    t.datetime "demand_date"
    t.string "demand_by"
    t.string "recommended_by"
    t.boolean "needed_to_purchase"
    t.string "ordered_by"
    t.datetime "ordered_date"
    t.string "recorded_by"
    t.datetime "recorded_date"
    t.integer "user_id"
    t.integer "fiscal_year_id"
    t.integer "office_id"
    t.integer "project_id"
    t.integer "item_id"
    t.boolean "marked_as_final"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_evaluation_items", force: :cascade do |t|
    t.integer "item_classification_no"
    t.integer "item_register_page_no"
    t.string "name_of_item_ne"
    t.string "name_of_item_en"
    t.string "unit_ne"
    t.string "unit_en"
    t.decimal "quantity"
    t.decimal "amount"
    t.decimal "mached"
    t.decimal "unmatched"
    t.decimal "decreased_quantity"
    t.decimal "increased_quantity"
    t.decimal "dein_quantity"
    t.decimal "working"
    t.decimal "not_working"
    t.decimal "to_be_repaired"
    t.decimal "to_be_auctioned"
    t.decimal "to_be_dispose"
    t.decimal "to_be_conserved"
    t.decimal "total_amount"
    t.string "remarks"
    t.integer "item_id"
    t.integer "project_item_id"
    t.integer "office_id"
    t.integer "user_id"
    t.integer "fiscal_year_id"
    t.string "fy"
    t.boolean "marked_as_final"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_evaluations", force: :cascade do |t|
    t.string "fy"
    t.datetime "committee_formation_date"
    t.datetime "report_submission_date"
    t.integer "office_id"
    t.integer "user_id"
    t.integer "fiscal_year_id"
    t.boolean "marked_as_final"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_handover_form_items", force: :cascade do |t|
    t.integer "item_classification_no"
    t.integer "item_register_page_no"
    t.string "name_of_item_ne"
    t.string "name_of_item_en"
    t.string "specification"
    t.string "item_identification_no"
    t.string "model_no"
    t.string "unit_ne"
    t.string "unit_en"
    t.string "quantity"
    t.string "amount"
    t.string "received_date"
    t.string "physical_status"
    t.string "fy"
    t.integer "fiscal_year_id"
    t.integer "user_id"
    t.integer "office_id"
    t.integer "project_id"
    t.integer "handover_form_id"
    t.integer "item_id"
    t.integer "project_item_id"
    t.integer "project_handover_form_id"
    t.string "country"
    t.string "size"
    t.string "approx_age"
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_handover_forms", force: :cascade do |t|
    t.integer "decision_no"
    t.datetime "decision_date"
    t.string "fy"
    t.string "handovered_project_name"
    t.datetime "date"
    t.integer "form_no"
    t.string "store_chief_name"
    t.string "store_chief_designation"
    t.datetime "store_chief_sign_date"
    t.string "office_chief_name"
    t.string "office_chief_designation"
    t.datetime "office_chief_signed_date"
    t.integer "office_id"
    t.integer "user_id"
    t.integer "fiscal_year_id"
    t.boolean "marked_as_final"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_items", force: :cascade do |t|
    t.string "name_of_item_ne"
    t.string "name_of_item_en"
    t.string "specification"
    t.string "unit_ne"
    t.string "unit_en"
    t.integer "item_register_page_no"
    t.integer "item_classification_no"
    t.integer "item_id"
    t.integer "office_id"
    t.integer "fiscal_year_id"
    t.integer "project_id"
    t.string "model_no"
    t.integer "item_identification_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_purchase_entries", force: :cascade do |t|
    t.datetime "entry_date"
    t.string "bill_no"
    t.integer "entry_no"
    t.string "store_chief_name"
    t.string "store_chief_designation"
    t.datetime "store_chief_signed_date"
    t.string "section_chief_name"
    t.string "section_chief_designation"
    t.datetime "section_chief_signed_date"
    t.string "office_chief_name"
    t.string "office_chief_designation"
    t.datetime "office_chief_signed_date"
    t.integer "user_id"
    t.integer "office_id"
    t.integer "fiscal_year_id"
    t.integer "item_id"
    t.integer "item_register_page_no"
    t.string "purchase_handover_no"
    t.string "fy"
    t.boolean "marked_as_final"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_purchase_entry_items", force: :cascade do |t|
    t.integer "item_classification_no"
    t.integer "item_register_page_no"
    t.string "name_of_item_ne"
    t.string "name_of_item_en"
    t.string "specification"
    t.string "item_identification_no"
    t.string "model_no"
    t.string "unit_ne"
    t.string "unit_en"
    t.decimal "quantity"
    t.decimal "rate"
    t.decimal "amount_without_vat"
    t.decimal "vat"
    t.decimal "total_amount"
    t.decimal "other_expenses"
    t.decimal "amount"
    t.string "remarks"
    t.integer "project_purchase_entry_id"
    t.integer "user_id"
    t.integer "office_id"
    t.string "fy"
    t.integer "item_id"
    t.integer "fiscal_year_id"
    t.integer "project_item_id"
    t.string "country"
    t.string "size"
    t.string "approx_age"
    t.string "source"
    t.boolean "is_vatable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_purchase_order_items", force: :cascade do |t|
    t.integer "item_classification_no"
    t.string "name_of_item_en"
    t.string "name_of_item_ne"
    t.string "specification"
    t.string "unit_ne"
    t.string "unit_en"
    t.decimal "quantity"
    t.decimal "rate"
    t.decimal "amount"
    t.string "remarks"
    t.integer "project_purchase_order_id"
    t.integer "office_id"
    t.integer "item_id"
    t.string "fy"
    t.integer "fiscal_year_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_purchase_orders", force: :cascade do |t|
    t.string "vendor_name"
    t.string "vendor_address"
    t.string "vendor_registration"
    t.string "vendor_phone"
    t.string "vendor_pan"
    t.string "order_no"
    t.datetime "order_date"
    t.integer "order_decision_no"
    t.datetime "order_decision_date"
    t.string "office_name"
    t.string "office_address"
    t.string "store_chief_name"
    t.datetime "store_chief_signed_date"
    t.string "office_chief_name"
    t.datetime "office_chief_signed_date"
    t.string "section_chief_name"
    t.datetime "section_cheif_signed_date"
    t.integer "user_id"
    t.string "fy"
    t.datetime "fiscal_year_signed_date"
    t.integer "office_id"
    t.integer "project_id"
    t.boolean "marked_as_final"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_purchase_tenders", force: :cascade do |t|
    t.integer "office_id"
    t.integer "user_id"
    t.integer "fiscal_year_id"
    t.string "tender_no"
    t.string "tender_name"
    t.datetime "tender_date"
    t.boolean "marked_as_final"
    t.string "bidders_name"
    t.string "bidders_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_release_items", force: :cascade do |t|
    t.string "name_of_item_ne"
    t.string "name_of_item_en"
    t.integer "item_register_page_no"
    t.string "code_no"
    t.string "specificaiton"
    t.string "unit_en"
    t.string "unit_ne"
    t.decimal "quantity"
    t.decimal "rate"
    t.decimal "amount"
    t.string "remarks"
    t.integer "project_item_id"
    t.integer "project_release_id"
    t.integer "user_id"
    t.integer "office_id"
    t.integer "item_id"
    t.integer "fiscal_year_id"
    t.integer "release_from"
    t.string "item_classification_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_releases", force: :cascade do |t|
    t.string "fy"
    t.integer "release_no"
    t.datetime "release_date"
    t.string "store_chief_name"
    t.datetime "store_chief_signed_date"
    t.string "office_chief_name"
    t.datetime "office_chief_signed_date"
    t.integer "user_id"
    t.integer "office_id"
    t.integer "project_id"
    t.integer "fiscal_year_id"
    t.integer "marked_as_final"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_stock_items", force: :cascade do |t|
    t.integer "item_register_page_no"
    t.integer "item_classification_no"
    t.string "name_of_item_en"
    t.string "name_of_item_ne"
    t.string "unit_en"
    t.string "unit_ne"
    t.decimal "quantity"
    t.decimal "rate"
    t.decimal "amount"
    t.string "physical_status"
    t.string "remarks"
    t.integer "office_id"
    t.integer "project_id"
    t.integer "item_id"
    t.integer "user_id"
    t.integer "fiscal_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_stocks", force: :cascade do |t|
    t.string "fy"
    t.string "store_chief_name"
    t.string "store_chief_designation"
    t.datetime "store_chief_signed_date"
    t.string "section_chief_name"
    t.datetime "section_chief_signed_date"
    t.string "section_chief_degination"
    t.string "office_chief_name"
    t.string "office_chief_designation"
    t.datetime "office_chief_signed_date"
    t.integer "office_id"
    t.integer "project_id"
    t.integer "user_id"
    t.integer "fiscal_year_id"
    t.integer "item_id"
    t.boolean "marked_as_final"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_tender_breakdowns", force: :cascade do |t|
    t.integer "office_id"
    t.integer "user_id"
    t.integer "project_purchase_tender_id"
    t.integer "project_id"
    t.string "project_name_en"
    t.string "project_name_ne"
    t.boolean "marked_as_final"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "fiscal_year_id"
    t.string "fy"
  end

  create_table "project_tender_items", force: :cascade do |t|
    t.string "name_of_item_ne"
    t.string "name_of_item_en"
    t.string "unit_ne"
    t.string "unit_en"
    t.decimal "quantity"
    t.decimal "rate"
    t.decimal "amount"
    t.integer "office_id"
    t.integer "user_id"
    t.datetime "received_date"
    t.integer "project_purchase_tender_id"
    t.string "fy"
    t.integer "fiscal_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "item_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name_of_project_ne"
    t.string "name_of_project_en"
    t.string "name_of_consumer_committee"
    t.string "address"
    t.string "phone_of_committee_representative"
    t.string "name_of_committee_representative"
    t.string "post_of_representative"
    t.string "contractor"
    t.string "phone_of_contractor_representative"
    t.string "name_of_contractor_representative"
    t.integer "user_id"
    t.integer "office_id"
    t.integer "fiscal_year_id"
    t.integer "project_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchase_order_items", force: :cascade do |t|
    t.integer "item_classification_no"
    t.string "name_of_item_en"
    t.string "name_of_item_ne"
    t.string "specification"
    t.string "unit_ne"
    t.string "unit_en"
    t.decimal "quantity"
    t.decimal "rate"
    t.decimal "amount"
    t.string "remarks"
    t.integer "purchase_order_id"
    t.integer "office_id"
    t.integer "user_id"
    t.string "fy"
    t.integer "fiscal_year_id"
    t.integer "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchase_orders", force: :cascade do |t|
    t.string "vendor_name"
    t.string "vendor_address"
    t.string "vendor_registration"
    t.string "vendor_phone"
    t.string "vendor_pan"
    t.integer "order_no"
    t.datetime "order_date"
    t.integer "order_decision_no"
    t.datetime "order_decision_date"
    t.datetime "date_to_receive_goods"
    t.string "office_name"
    t.string "office_address"
    t.string "store_chief_name"
    t.datetime "store_chief_signed_date"
    t.string "section_chief_name"
    t.datetime "section_chief_signed_date"
    t.datetime "office_cheif_signed_date"
    t.string "office_cheif_name"
    t.integer "user_id"
    t.string "fy"
    t.integer "fiscal_year_id"
    t.integer "office_id"
    t.boolean "marked_as_final"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rental_record_register_items", force: :cascade do |t|
    t.datetime "date"
    t.string "name_of_vendor"
    t.string "address_of_vendor"
    t.datetime "approval_date"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "unit"
    t.decimal "duration"
    t.decimal "rate"
    t.string "total_amount"
    t.integer "receipt_or_voucher_no"
    t.datetime "returned_date"
    t.string "remarks"
    t.integer "user_id"
    t.integer "office_id"
    t.string "fy"
    t.integer "fiscal_year_id"
    t.integer "rental_record_register_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rental_record_registers", force: :cascade do |t|
    t.string "name_of_item_ne"
    t.string "name_of_item_en"
    t.integer "item_classification_no"
    t.boolean "is_taken_in_rent"
    t.boolean "is_given_in_rent"
    t.string "specification"
    t.string "model_no"
    t.string "item_identification_no"
    t.integer "item_register_page_no"
    t.decimal "total_price"
    t.string "sotre_chief_name"
    t.string "store_chief_designation"
    t.datetime "store_chief_signed_date"
    t.string "office_chief_name"
    t.string "office_chief_designation"
    t.datetime "office_chief_signed_date"
    t.integer "item_id"
    t.integer "office_id"
    t.integer "user_id"
    t.string "fy"
    t.integer "fiscal_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "repair_application_form_items", force: :cascade do |t|
    t.string "name_of_item_ne"
    t.string "name_of_item_en"
    t.string "item_identification_no"
    t.decimal "approx_repair_cost"
    t.string "reason_to_repair"
    t.string "applicant_sign"
    t.string "remarks"
    t.integer "user_id"
    t.integer "office_id"
    t.integer "repair_application_form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "repair_application_forms", force: :cascade do |t|
    t.integer "application_no"
    t.datetime "date"
    t.string "year"
    t.string "month"
    t.string "vendor_name"
    t.string "vendor_address"
    t.string "vendor_phone"
    t.string "vendor_registration_no"
    t.string "vendor_pan"
    t.datetime "within_date"
    t.string "office_name"
    t.string "office_address"
    t.string "section_chief_name"
    t.string "section_chief_designation"
    t.datetime "section_chief_signed_date"
    t.string "technical_person_name"
    t.string "technical_person_designation"
    t.datetime "technical_person_signed_date"
    t.string "office_chief_name"
    t.string "office_chief_designation"
    t.datetime "office_chief_signed_date"
    t.integer "office_id"
    t.string "fy"
    t.integer "fiscal_year_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "repair_record_register_items", force: :cascade do |t|
    t.datetime "date"
    t.integer "repair_application_no"
    t.string "applicat_name"
    t.string "changed_part_name"
    t.decimal "changesd_part_cost"
    t.string "other_expense"
    t.decimal "other_expense_cost"
    t.decimal "total_expense"
    t.string "vendor_name"
    t.string "justified_by"
    t.string "remarks"
    t.integer "user_id"
    t.integer "office_id"
    t.string "fy"
    t.integer "fiscal_year_id"
    t.integer "repair_record_register_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "repair_record_registers", force: :cascade do |t|
    t.string "name_of_item_ne"
    t.string "name_of_item_en"
    t.string "page_no"
    t.string "specificaiton"
    t.string "item_identification"
    t.string "model"
    t.integer "item_register_page_no"
    t.decimal "price"
    t.string "store_chief_name"
    t.string "sotre_chief_designation"
    t.datetime "store_chief_signed_date"
    t.string "office_chief_name"
    t.string "office_chief_designation"
    t.datetime "office_chief_signed_date"
    t.integer "user_id"
    t.integer "office_id"
    t.string "fy"
    t.integer "fiscal_year_id"
    t.string "month"
    t.string "year"
    t.integer "office_item_id"
    t.integer "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "store_bodies", force: :cascade do |t|
    t.string "office_chief_name"
    t.string "office_chief_degination"
    t.string "section_chief_name"
    t.string "section_chief_degination"
    t.string "store_keeper_designation"
    t.string "store_keeper_name"
    t.integer "office_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "active_fiscal_year", default: 0, null: false
    t.boolean "is_admin", default: false, null: false
    t.string "name", default: "User", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "office_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vendors", force: :cascade do |t|
    t.string "vendor_name"
    t.string "vendor_registration"
    t.string "vendor_pan"
    t.string "vendor_address"
    t.string "vendor_representive"
    t.string "vendor_phone"
    t.string "vendor_email"
    t.integer "fiscal_year_id"
    t.integer "office_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "vendor_name_en"
  end

end
