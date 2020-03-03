Rails.application.routes.draw do
   root "office/offices#index"
   devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions'
  }
resources :users

namespace :office do
  resources :vendors, :except => ['show']
  resources :land_and_structure_record_book_items
  resources :land_and_structure_record_books
  resources :rental_record_register_items
  resources :rental_record_registers
  resources :repair_record_register_items
  resources :repair_record_registers
  resources :repair_application_form_items
  resources :repair_application_forms
  resources :stock_items
  resources :stocks
  resources :item_assistance_register_items
  resources :item_assistance_registers
  resources :project_item_evaluation_items
  resources :evaluation_committees
  resources :item_evaluations
  resources :item_disposal_items
  resources :item_disposals
  resources :handover_form_items
  resources :handover_forms
  post "/handover_form/mark_as_final/:id" => "handover_forms#mark_as_final", as: :mark_office_handover_form_as_final
  resources :release_items
  post "/office_releases/mark_as_final/:id" => "releases#mark_as_final"
  resources :releases
  resources :purchase_entry_items
  resources :purchase_entries
  post '/purchase_entries/mark_as_final/:id' => "purchase_entries#mark_as_final", as: :mark_ope_as_final
  resources :purchase_order_items
  resources :purchase_orders
  post '/purchase_orders/marked_as_final/:id' => "purchase_orders#mark_as_final", as: :mark_po_as_final
  resources :demand_items
  resources :demands
  post '/demands/mark_as_final/:id' => "demands#mark_as_final", as: :mark_demand_as_final
  resources :item_entries
  resources :items
  resources :personnels
  resources :item_categories, except: [:show]
  resources :fiscal_years
  resources :offices
  resources :store_bodies
  resources :active_fiscal_year

  #Office_Data_import
  get '/item_categories/import' => "item_categories#new_import", as: :item_category_import
  post '/item_categories/import' => "item_categories#create_import", as: :item_category_create


  #Office_Data_export
  get '/item_categories/export' => "item_categories#new_import", as: :item_category_export

  #office_report
  #report printing
  get '/report/vendors' => "report#vendors", as: :vendors_report
  get '/report/personnels' => "report#personnels", as: :personnels_print
  get '/report/office_demand_form/:id' => "report#office_demand_form"
  get '/report/purchase_order/:id' => "report#purchase_order"
  get '/report/office_purchase_entry/:id' => "report#office_purchase_entry"
  get '/report/office_release/:id' => "report#office_release"
  get '/report/office_item_assistance_register/:id' => "report#office_item_assistance_register"
  get '/report/oeirt_ledger' => "report#oeirt_ledger", as: :oeirt_ledger
  get '/report/oneirt_ledger' => "report#oneirt_ledger", as: :oneirt_ledger
  get '/report/office_handover_form/:id' => "report#office_handover_form", as: :office_handover_report
  get '/report/repair_application_form/:id' => "report#repair_application_form", as: :repair_application_report
  get '/report/project_purchase_entry/:id' => "report#project_purchase_entry", as: :project_main_entry_report
end
namespace :project do
  resources :purchase_entries
  resources :purchase_entry_items
  resources :tender_breakdown_items
  resources :item_categories
  resources :tender_breakdowns
  post "tender_breakdowns/marked_as_final/:id" => "project_tender_breakdowns#marked_as_final", as: :ptm_marked_as_final
  resources :tender_items
  resources :tenders
  post "purchase_tender/mark_as_final/:id" => "project_tenders#mark_as_final", as: :project_tender_maf
  post "purchase_tender/generate_entry/:id" => "project_tenders#generate_entry", as: :project_main_entry
  resources :purchase_orders
  post "purchase_orders/mark_as_final/:id" => "project_purchase_orders#mark_as_final", as: :ppo_maf
  resources :purchase_order_items
  resources :pneirts
  resources :projects
  resources :stocks
  resources :stock_items
  resources :releases
  resources :release_items
  resources :items
  get "items/transactions/:project_item_id" => "report#project_eitem_transactions", as: :pits_report
  resources :evaluations
  resources :evaluation_items
  resources :handover_forms
  resources :handover_form_items
  resources :demands
  resources :demand_items
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
