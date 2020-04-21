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

ActiveRecord::Schema.define(version: 2020_04_20_081627) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "office_active_fiscal_years", force: :cascade do |t|
    t.string "fy"
    t.integer "fiscal_year_id"
    t.integer "office_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "office_demand_items", force: :cascade do |t|
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

  create_table "office_demands", force: :cascade do |t|
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
    t.boolean "entry_generated"
    t.integer "store_body_id"
    t.string "file"
  end

  create_table "office_fiscal_years", force: :cascade do |t|
    t.string "fy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "office_id"
    t.boolean "status"
    t.datetime "start_date"
    t.datetime "closing_date"
    t.integer "user_id"
  end

  create_table "office_handover_form_items", force: :cascade do |t|
    t.string "specification"
    t.integer "item_identification_no"
    t.string "model_no"
    t.decimal "quantity"
    t.decimal "amount"
    t.datetime "received_date"
    t.string "physical_status"
    t.string "fy"
    t.integer "fiscal_year_id"
    t.integer "user_id"
    t.integer "office_id"
    t.integer "project_id"
    t.integer "handover_form_id"
    t.integer "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "country"
    t.string "size"
    t.string "age_approx"
    t.string "source"
    t.integer "subed_from"
    t.decimal "rate"
  end

  create_table "office_handover_forms", force: :cascade do |t|
    t.datetime "decision_date"
    t.string "fy"
    t.integer "decision_no"
    t.string "handovered_office_name"
    t.datetime "date"
    t.integer "form_no"
    t.integer "store_body_id"
    t.integer "office_id"
    t.integer "user_id"
    t.integer "fiscal_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "marked_as_final"
    t.datetime "office_chief_signed_date"
    t.datetime "section_chief_signed_date"
    t.datetime "store_keeper_signed_date"
    t.boolean "entry_generated"
    t.string "file"
  end

  create_table "office_item_assistance_register_items", force: :cascade do |t|
    t.datetime "date"
    t.integer "order_release_no"
    t.string "specification"
    t.string "item_identification_no"
    t.string "model_no"
    t.decimal "quantity"
    t.decimal "amount"
    t.datetime "taken_date"
    t.datetime "date_to_be_returned"
    t.decimal "returned_quantity"
    t.datetime "returned_date"
    t.integer "user_id"
    t.integer "office_id"
    t.string "fy"
    t.integer "fiscal_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "item_assistance_register_id"
    t.integer "item_id"
    t.integer "item_transaction_id"
    t.string "returned_by"
  end

  create_table "office_item_assistance_registers", force: :cascade do |t|
    t.integer "register_page_no"
    t.integer "store_body_id"
    t.integer "user_id"
    t.integer "office_id"
    t.integer "item_id"
    t.integer "fiscal_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "personnel_name_ne"
    t.string "designation"
    t.integer "personnel_id"
    t.datetime "office_chief_signed_date"
    t.string "file"
  end

  create_table "office_item_categories", force: :cascade do |t|
    t.string "name_ne"
    t.string "name_en"
    t.string "unit_ne"
    t.string "unit_en"
    t.integer "user_id"
    t.integer "office_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "temp_id"
  end

  create_table "office_item_disposal_items", force: :cascade do |t|
    t.integer "item_id"
    t.string "unit_ne"
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
    t.integer "item_disposal_id"
    t.integer "item_transaction_id"
    t.integer "new_item_transaction_id"
    t.integer "store_body_id"
  end

  create_table "office_item_disposals", force: :cascade do |t|
    t.string "fy"
    t.datetime "decision_date"
    t.string "decision_made_by"
    t.integer "store_body_id"
    t.integer "office_id"
    t.integer "user_id"
    t.integer "fiscal_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.datetime "store_keeper_signed_date"
    t.datetime "section_chief_signed_date"
    t.datetime "office_chief_signed_date"
    t.boolean "accepted"
    t.boolean "entry_generated"
    t.string "file"
  end

  create_table "office_item_evaluation_committee_members", force: :cascade do |t|
    t.integer "office_id"
    t.integer "user_id"
    t.integer "fiscal_year_id"
    t.integer "personnel_id"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "item_evaluation_committee_id"
  end

  create_table "office_item_evaluation_committees", force: :cascade do |t|
    t.integer "user_id"
    t.integer "office_id"
    t.string "name"
    t.integer "fiscal_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "committee_formation_date"
    t.datetime "report_submission_date"
  end

  create_table "office_item_evaluation_items", force: :cascade do |t|
    t.decimal "quantity"
    t.decimal "amount"
    t.decimal "matched"
    t.decimal "unmatched"
    t.decimal "dquantity"
    t.decimal "iquantity"
    t.decimal "diquantity"
    t.decimal "working"
    t.integer "item_evaluation_id"
    t.decimal "notworking"
    t.decimal "to_be_repaired"
    t.decimal "to_be_auctioned"
    t.decimal "to_be_disposed"
    t.decimal "to_be_conserved"
    t.decimal "total_amount"
    t.string "remarks"
    t.integer "item_id"
    t.integer "user_id"
    t.integer "office_id"
    t.integer "fiscal_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "project_id"
    t.integer "store_body_id"
    t.decimal "rate"
    t.decimal "total_quantity"
    t.string "name_of_item_ne"
    t.integer "item_register_page_no"
    t.integer "item_classification_no"
    t.string "unit_ne"
    t.string "name_of_item_en"
    t.string "unit_en"
  end

  create_table "office_item_evaluations", force: :cascade do |t|
    t.integer "office_id"
    t.integer "user_id"
    t.integer "fiscal_year_id"
    t.integer "item_evaluation_committee_id"
    t.string "report_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file"
    t.string "name_of_item_en"
    t.string "unit_en"
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
    t.string "file"
  end

  create_table "office_item_transactions", force: :cascade do |t|
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
    t.integer "purchase_entry_item_id"
    t.string "remarks"
    t.decimal "sku"
    t.integer "release_item_id"
    t.integer "entry_no"
    t.string "country"
    t.string "size"
    t.string "approx_age"
    t.string "source"
    t.integer "handover_form_item_id"
    t.integer "item_classification_no"
    t.boolean "in_use"
    t.integer "temp_item_id"
    t.integer "store_body_id"
  end

  create_table "office_items", force: :cascade do |t|
    t.string "name_of_item_ne"
    t.string "name_of_item_en"
    t.string "unit_ne"
    t.string "unit_en"
    t.integer "office_id"
    t.integer "user_id"
    t.integer "item_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "specification"
    t.integer "item_classification"
    t.integer "item_category_id"
    t.integer "item_classification_no"
    t.integer "item_register_page_no"
    t.integer "temp_id"
    t.integer "temp_cat_id"
  end

  create_table "office_offices", force: :cascade do |t|
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
    t.boolean "has_project_access"
  end

  create_table "office_personnels", force: :cascade do |t|
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
    t.boolean "working"
  end

  create_table "office_property_register_items", force: :cascade do |t|
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

  create_table "office_property_registers", force: :cascade do |t|
    t.datetime "store_chief_signed_date"
    t.string "office_chief_signed_date"
    t.integer "store_body_id"
    t.integer "user_id"
    t.string "fy"
    t.integer "fiscal_year_id"
    t.integer "office_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file"
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
    t.integer "store_body_id"
    t.boolean "ledger_entry_generated"
    t.integer "purchase_order_id"
    t.string "generated_from"
    t.integer "tender_id"
    t.string "file"
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
    t.integer "purchase_entry_id"
    t.integer "user_id"
    t.integer "office_id"
    t.string "fy"
    t.integer "item_id"
    t.integer "fiscal_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "country"
    t.string "size"
    t.string "approx_age"
    t.string "source"
    t.boolean "is_vatable"
  end

  create_table "office_purchase_order_items", force: :cascade do |t|
    t.string "specification"
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
    t.decimal "vat"
    t.decimal "amount_without_vat"
    t.boolean "is_vatable"
  end

  create_table "office_purchase_orders", force: :cascade do |t|
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
    t.datetime "store_chief_signed_date"
    t.datetime "section_chief_signed_date"
    t.datetime "office_chief_signed_date"
    t.integer "user_id"
    t.string "fy"
    t.integer "fiscal_year_id"
    t.integer "office_id"
    t.boolean "marked_as_final"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "vendor_id"
    t.integer "store_body_id"
    t.boolean "entry_generated"
    t.string "file"
  end

  create_table "office_release_items", force: :cascade do |t|
    t.integer "item_register_page_no"
    t.string "code_no"
    t.decimal "quantity"
    t.decimal "rate"
    t.decimal "amount"
    t.string "remarks"
    t.integer "release_id"
    t.integer "user_id"
    t.integer "office_id"
    t.integer "item_id"
    t.integer "fiscal_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "item_classification_no"
    t.integer "released_from"
    t.integer "item_transaction_id"
    t.integer "subed_from"
  end

  create_table "office_releases", force: :cascade do |t|
    t.string "fy"
    t.integer "release_no"
    t.datetime "release_date"
    t.integer "store_body_id"
    t.integer "user_id"
    t.integer "office_id"
    t.integer "fiscal_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "marked_as_final"
    t.string "received_by"
    t.datetime "received_date"
    t.boolean "entry_generated"
    t.datetime "store_keeper_signed_date"
    t.datetime "office_chief_signed_date"
    t.integer "demand_id"
    t.string "file"
  end

  create_table "office_rental_record_register_items", force: :cascade do |t|
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
    t.decimal "pr_amount"
    t.boolean "accepted"
  end

  create_table "office_rental_record_registers", force: :cascade do |t|
    t.integer "store_body_id"
    t.boolean "is_taken_in_rent"
    t.boolean "is_given_in_rent"
    t.string "specification"
    t.string "model_no"
    t.string "item_identification_no"
    t.integer "item_register_page_no"
    t.decimal "total_price"
    t.datetime "store_keeper_signed_date"
    t.datetime "office_chief_signed_date"
    t.integer "item_id"
    t.integer "office_id"
    t.integer "user_id"
    t.integer "fiscal_year_id"
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "item_classification_no"
    t.integer "item_transaction_id"
  end

  create_table "office_repair_application_form_items", force: :cascade do |t|
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
    t.integer "fiscal_year_id"
    t.integer "item_id"
    t.integer "item_transaction_id"
  end

  create_table "office_repair_application_forms", force: :cascade do |t|
    t.integer "application_no"
    t.datetime "date"
    t.string "year"
    t.string "month"
    t.datetime "within_date"
    t.string "office_name"
    t.string "office_address"
    t.datetime "section_chief_signed_date"
    t.string "technical_person_name"
    t.string "technical_person_designation"
    t.datetime "technical_person_signed_date"
    t.integer "store_body_id"
    t.datetime "office_chief_signed_date"
    t.integer "office_id"
    t.string "fy"
    t.integer "fiscal_year_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "vendor_id"
    t.string "file"
  end

  create_table "office_repair_record_register_items", force: :cascade do |t|
    t.datetime "date"
    t.integer "repair_application_no"
    t.string "applicant_name"
    t.string "changed_part_name"
    t.decimal "changed_part_cost"
    t.string "other_expense"
    t.decimal "other_expense_cost"
    t.decimal "total_expense"
    t.string "justified_by"
    t.string "remarks"
    t.integer "user_id"
    t.integer "office_id"
    t.string "fy"
    t.integer "fiscal_year_id"
    t.integer "repair_record_register_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "item_id"
    t.integer "vendor_id"
  end

  create_table "office_repair_record_registers", force: :cascade do |t|
    t.string "name_of_item_ne"
    t.string "name_of_item_en"
    t.string "page_no"
    t.string "specification"
    t.string "item_identification"
    t.string "model"
    t.integer "item_register_page_no"
    t.decimal "price"
    t.integer "store_body_id"
    t.datetime "store_chief_signed_date"
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
    t.integer "item_transaction_id"
    t.string "file"
  end

  create_table "office_stock_items", force: :cascade do |t|
    t.decimal "quantity"
    t.decimal "rate"
    t.decimal "amount"
    t.string "physical_status"
    t.string "remarks"
    t.integer "office_id"
    t.integer "item_id"
    t.integer "user_id"
    t.integer "fiscal_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "store_body_id"
    t.integer "stock_id"
    t.string "name_of_item_ne"
    t.integer "item_classification_no"
    t.integer "item_register_page_no"
    t.string "unit_ne"
  end

  create_table "office_stocks", force: :cascade do |t|
    t.datetime "store_chief_signed_date"
    t.datetime "section_chief_signed_date"
    t.datetime "office_chief_signed_date"
    t.integer "store_body_id"
    t.integer "office_id"
    t.integer "project_id"
    t.integer "user_id"
    t.integer "fiscal_year_id"
    t.boolean "accepted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file"
  end

  create_table "office_store_bodies", force: :cascade do |t|
    t.string "office_chief_name"
    t.string "office_chief_designation"
    t.string "section_chief_name"
    t.string "section_chief_designation"
    t.string "store_keeper_designation"
    t.string "store_keeper_name"
    t.integer "office_id"
    t.integer "fiscal_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "office_tender_items", force: :cascade do |t|
    t.integer "store_body_id"
    t.decimal "quantity"
    t.decimal "rate"
    t.decimal "amount"
    t.integer "office_id"
    t.integer "user_id"
    t.datetime "received_date"
    t.integer "tender_id"
    t.string "fy"
    t.integer "fiscal_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "item_id"
    t.decimal "sku"
    t.integer "item_classification_no"
    t.string "specification"
    t.string "item_identification_no"
    t.string "model_no"
    t.string "size"
    t.string "approx_age"
    t.string "source"
    t.boolean "is_vatable"
    t.decimal "amount_without_vat"
    t.decimal "vat"
    t.decimal "other_expense"
    t.string "country"
    t.string "remarks"
    t.decimal "total_amount"
    t.integer "item_register_page_no"
  end

  create_table "office_tenders", force: :cascade do |t|
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
    t.integer "store_body_id"
    t.boolean "entry_generated"
  end

  create_table "office_vendors", force: :cascade do |t|
    t.string "vendor_name"
    t.string "vendor_registration"
    t.string "vendor_pan"
    t.string "vendor_address"
    t.string "vendor_representative"
    t.string "vendor_phone"
    t.string "vendor_email"
    t.integer "fiscal_year_id"
    t.integer "office_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "vendor_name_en"
  end

  create_table "project_demand_items", force: :cascade do |t|
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
    t.integer "demand_id"
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
    t.boolean "entry_generated"
    t.integer "store_body_id"
    t.string "file"
  end

  create_table "project_evaluation_items", force: :cascade do |t|
    t.integer "item_classification_no"
    t.decimal "quantity"
    t.decimal "amount"
    t.decimal "matched"
    t.decimal "unmatched"
    t.decimal "dquantity"
    t.decimal "iquantity"
    t.decimal "diquantity"
    t.decimal "working"
    t.decimal "not_working"
    t.decimal "to_be_repaired"
    t.decimal "to_be_auctioned"
    t.decimal "to_be_disposed"
    t.decimal "to_be_conserved"
    t.decimal "total_quantity"
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
    t.integer "item_evaluation_id"
    t.integer "project_id"
    t.integer "store_body_id"
    t.decimal "rate"
  end

  create_table "project_evaluations", force: :cascade do |t|
    t.datetime "committee_formation_date"
    t.datetime "report_submission_date"
    t.integer "office_id"
    t.integer "user_id"
    t.integer "fiscal_year_id"
    t.integer "evaluation_committee_id"
    t.boolean "marked_as_final"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "store_body_id"
    t.string "file"
  end

  create_table "project_handover_form_items", force: :cascade do |t|
    t.string "specification"
    t.string "item_identification_no"
    t.string "model_no"
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
    t.integer "project_item_id"
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
    t.datetime "date"
    t.integer "form_no"
    t.datetime "store_chief_sign_date"
    t.datetime "office_chief_signed_date"
    t.integer "office_id"
    t.integer "user_id"
    t.integer "project_id"
    t.integer "fiscal_year_id"
    t.boolean "marked_as_final"
    t.integer "store_body_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file"
  end

  create_table "project_item_categories", force: :cascade do |t|
    t.string "name_ne"
    t.string "name_en"
    t.string "unit_ne"
    t.string "unit_en"
    t.integer "user_id"
    t.integer "office_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "temp_id"
  end

  create_table "project_item_evaluation_items", force: :cascade do |t|
    t.decimal "quantity"
    t.decimal "amount"
    t.decimal "matched"
    t.decimal "unmatched"
    t.decimal "dquantity"
    t.decimal "iquantity"
    t.decimal "diquantity"
    t.decimal "working"
    t.integer "item_evaluation_id"
    t.decimal "notworking"
    t.decimal "to_be_repaired"
    t.decimal "to_be_auctioned"
    t.decimal "to_be_disposed"
    t.decimal "to_be_conserved"
    t.decimal "total_amount"
    t.string "remarks"
    t.integer "item_id"
    t.integer "office_item_id"
    t.integer "user_id"
    t.integer "office_id"
    t.integer "fiscal_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "project_id"
    t.integer "store_body_id"
    t.integer "project_item_id"
    t.decimal "rate"
    t.decimal "total_quantity"
    t.string "name_of_item_ne"
    t.integer "item_register_page_no"
    t.integer "item_classification_no"
    t.string "unit_ne"
    t.string "name_of_item_en"
    t.string "unit_en"
  end

  create_table "project_item_evaluations", force: :cascade do |t|
    t.integer "office_id"
    t.integer "user_id"
    t.integer "fiscal_year_id"
    t.integer "item_evaluation_committee_id"
    t.string "report_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file"
    t.string "name_of_item_en"
    t.string "unit_en"
  end

  create_table "project_item_transactions", force: :cascade do |t|
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
    t.integer "purchase_entry_item_id"
    t.string "remarks"
    t.decimal "sku"
    t.integer "release_item_id"
    t.integer "entry_no"
    t.string "country"
    t.string "size"
    t.string "approx_age"
    t.string "source"
    t.integer "handover_form_item_id"
    t.integer "item_classification_no"
    t.boolean "in_use"
    t.integer "store_body_id"
  end

  create_table "project_items", force: :cascade do |t|
    t.string "name_of_item_ne"
    t.string "name_of_item_en"
    t.string "unit_ne"
    t.string "unit_en"
    t.integer "office_id"
    t.integer "user_id"
    t.integer "item_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "specification"
    t.integer "item_category_id"
    t.integer "item_classification_no"
    t.integer "item_register_page_no"
    t.integer "temp_id"
    t.integer "temp_cat_id"
  end

  create_table "project_project_item_transactions", force: :cascade do |t|
    t.string "model"
    t.string "item_identification_no"
    t.string "country_of_origin"
    t.integer "project_item_id"
    t.integer "item_id"
    t.integer "office_id"
    t.integer "fiscal_year_id"
    t.integer "user_id"
    t.datetime "transaction_date"
    t.integer "transaction_type"
    t.decimal "rate"
    t.decimal "amount"
    t.decimal "quantity"
    t.integer "project_purchase_entry_item_id"
    t.string "remarks"
    t.decimal "sku"
    t.integer "release_item_id"
    t.integer "entry_no"
    t.string "country"
    t.string "size"
    t.string "approx_age"
    t.string "source"
    t.integer "handover_form_item_id"
    t.integer "item_classification_no"
    t.boolean "in_use"
    t.integer "project_id"
    t.integer "store_body_id"
  end

  create_table "project_project_items", force: :cascade do |t|
    t.string "name_of_item_ne"
    t.string "name_of_item_en"
    t.string "unit_ne"
    t.string "unit_en"
    t.string "office_id"
    t.integer "user_id"
    t.integer "item_no"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "specification"
    t.integer "item_id"
    t.integer "item_register_page_no"
    t.integer "item_classification_no"
    t.integer "item_category_id"
  end

  create_table "project_project_purchase_entries", force: :cascade do |t|
    t.datetime "entry_date"
    t.integer "entry_no"
    t.boolean "entry_generated"
    t.boolean "accepted"
    t.datetime "store_keeper_signed_date"
    t.datetime "section_chief_signed_date"
    t.datetime "office_chief_signed_date"
    t.integer "user_id"
    t.integer "office_id"
    t.integer "fiscal_year_id"
    t.integer "store_body_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "purchase_entry_id"
    t.string "file"
  end

  create_table "project_project_purchase_entry_items", force: :cascade do |t|
    t.integer "item_classification_no"
    t.integer "item_register_page_no"
    t.integer "item_id"
    t.integer "project_item_id"
    t.string "model_no"
    t.decimal "quantity"
    t.decimal "rate"
    t.decimal "amount_without_vat"
    t.decimal "vat"
    t.decimal "total_amount"
    t.decimal "other_expense"
    t.decimal "amount"
    t.string "remarks"
    t.integer "project_purchase_entry_id"
    t.integer "user_id"
    t.integer "office_id"
    t.integer "fiscal_year_id"
    t.string "country"
    t.string "size"
    t.string "approx_age"
    t.string "source"
    t.boolean "is_vatable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "item_identification_no"
    t.integer "project_id"
    t.integer "item_transaction_id"
    t.integer "project_item_transaction_id"
  end

  create_table "project_projects", force: :cascade do |t|
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
    t.integer "temp_id"
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
    t.string "fy"
    t.boolean "marked_as_final"
    t.integer "fiscal_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "purchase_handover_no"
    t.integer "store_body_id"
    t.boolean "ledger_entry_generated"
    t.integer "purchase_order_id"
    t.string "file"
    t.string "generated_from"
    t.integer "tender_id"
  end

  create_table "project_purchase_entry_items", force: :cascade do |t|
    t.string "specification"
    t.string "item_identification_no"
    t.string "model_no"
    t.decimal "quantity"
    t.decimal "rate"
    t.decimal "amount_without_vat"
    t.decimal "vat"
    t.decimal "total_amount"
    t.decimal "other_expense"
    t.decimal "amount"
    t.string "remarks"
    t.integer "purchase_entry_id"
    t.integer "user_id"
    t.integer "office_id"
    t.string "fy"
    t.integer "item_id"
    t.integer "fiscal_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "country"
    t.string "size"
    t.string "approx_age"
    t.string "source"
    t.boolean "is_vatable"
  end

  create_table "project_purchase_order_items", force: :cascade do |t|
    t.string "specification"
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
    t.decimal "vat"
    t.decimal "amount_without_vat"
    t.boolean "is_vatable"
  end

  create_table "project_purchase_orders", force: :cascade do |t|
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
    t.datetime "store_chief_signed_date"
    t.datetime "section_chief_signed_date"
    t.datetime "office_cheif_signed_date"
    t.integer "user_id"
    t.string "fy"
    t.integer "fiscal_year_id"
    t.integer "office_id"
    t.boolean "marked_as_final"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "vendor_id"
    t.integer "store_body_id"
    t.boolean "entry_generated"
    t.string "file"
  end

  create_table "project_release_items", force: :cascade do |t|
    t.decimal "quantity"
    t.decimal "rate"
    t.decimal "amount"
    t.string "remarks"
    t.integer "project_item_id"
    t.integer "release_id"
    t.integer "user_id"
    t.integer "office_id"
    t.integer "item_id"
    t.integer "fiscal_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "project_id"
    t.integer "item_transaction_id"
    t.integer "project_item_transaction_id"
  end

  create_table "project_releases", force: :cascade do |t|
    t.integer "release_no"
    t.datetime "release_date"
    t.integer "store_body_id"
    t.datetime "store_chief_signed_date"
    t.datetime "office_chief_signed_date"
    t.integer "user_id"
    t.integer "office_id"
    t.integer "project_id"
    t.integer "fiscal_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "received_by"
    t.datetime "received_date"
    t.integer "demand_id"
    t.boolean "entry_generated"
    t.boolean "accepted"
    t.string "file"
  end

  create_table "project_stock_items", force: :cascade do |t|
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
    t.integer "project_item_id"
    t.integer "store_body_id"
    t.integer "stock_id"
    t.string "name_of_item_ne"
    t.integer "item_classification_no"
    t.integer "item_register_page_no"
    t.string "unit_ne"
  end

  create_table "project_stocks", force: :cascade do |t|
    t.string "fy"
    t.datetime "store_chief_signed_date"
    t.datetime "section_chief_signed_date"
    t.datetime "office_chief_signed_date"
    t.integer "store_body_id"
    t.integer "office_id"
    t.integer "project_id"
    t.integer "user_id"
    t.integer "fiscal_year_id"
    t.integer "item_id"
    t.boolean "marked_as_final"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file"
  end

  create_table "project_tender_breakdown_items", force: :cascade do |t|
    t.integer "project_id"
    t.integer "tender_breakdown_id"
    t.decimal "quantity"
    t.decimal "rate"
    t.decimal "amount_without_vat"
    t.decimal "vat"
    t.decimal "total_amount"
    t.decimal "other_expense"
    t.decimal "amount"
    t.string "remarks"
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
    t.decimal "sku"
    t.integer "store_body_id"
    t.integer "purchase_entry_item_id"
  end

  create_table "project_tender_items", force: :cascade do |t|
    t.integer "store_body_id"
    t.decimal "quantity"
    t.decimal "rate"
    t.decimal "amount"
    t.integer "office_id"
    t.integer "user_id"
    t.datetime "received_date"
    t.integer "tender_id"
    t.string "fy"
    t.integer "fiscal_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "item_id"
    t.decimal "sku"
    t.integer "item_classification_no"
    t.string "specification"
    t.string "item_identification_no"
    t.string "model_no"
    t.string "size"
    t.string "approx_age"
    t.string "source"
    t.boolean "is_vatable"
    t.decimal "amount_without_vat"
    t.decimal "vat"
    t.decimal "other_expense"
    t.string "country"
    t.string "remarks"
    t.decimal "total_amount"
    t.integer "item_register_page_no"
  end

  create_table "project_tenders", force: :cascade do |t|
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
    t.integer "store_body_id"
    t.boolean "entry_generated"
    t.string "file"
  end

  create_table "setups", force: :cascade do |t|
    t.boolean "office"
    t.boolean "fiscal_year"
    t.boolean "active_fiscal_year"
    t.boolean "store_body"
    t.boolean "complete"
    t.integer "user_id"
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

end
