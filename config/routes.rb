Rails.application.routes.draw do
  resources :project_tender_breakdown_items
  get '/active_fiscal_year' => "active_fiscal_year#new", as: :set_active_fiscal_year
  patch '/active_fiscal_year/:id' => "active_fiscal_year#create"
  resources :store_bodies
  resources :project_tender_breakdowns
  post "project_tender_breakdowns/marked_as_final/:id" => "project_tender_breakdowns#marked_as_final", as: :ptm_marked_as_final
  resources :project_tender_items
  resources :project_purchase_tenders
  post "project_purchase_tender/mark_as_final/:id" => "project_purchase_tenders#mark_as_final", as: :project_purchase_tender_maf
  resources :project_purchase_orders
  post "project_purchase_orders/mark_as_final/:id" => "project_purchase_orders#mark_as_final", as: :ppo_maf
  resources :project_purchase_order_items
  resources :pneirts
  resources :projects
  resources :project_stocks
  resources :project_stock_items
  resources :project_releases
  resources :project_release_items
  resources :project_purchase_entry_items
  resources :project_purchase_entries
  post "project_purchase_entry/mark_as_final/:id" => "project_purchase_entries#mark_as_final", as: :ppe_mark_as_final
  resources :project_items
  resources :project_evaluations
  resources :project_evaluation_items
  resources :project_handover_forms
  resources :project_handover_form_items
  resources :peirts
  resources :project_demands
  resources :project_demand_items
  resources :vendors, :except => ['show']
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
  get '/report/project_purchase_entry/:id' => "report#project_purchase_entry", as: :ppe_report

  resources :land_and_structure_record_book_items
  resources :land_and_structure_record_books
  root "offices#index"
  resources :rental_record_register_items
  resources :rental_record_registers
  resources :repair_record_register_items
  resources :repair_record_registers
  resources :repair_application_form_items
  resources :repair_application_forms
  resources :office_stock_items
  resources :office_stocks
  resources :item_assistance_register_items
  resources :item_assistance_registers
  resources :project_item_evaluation_items
  resources :evaluation_committees
  resources :office_item_evaluations
  resources :item_disposal_items
  resources :item_disposals
  resources :office_handover_form_items
  resources :office_handover_forms
  post "/office_handover_form/mark_as_final/:id" => "office_handover_forms#mark_as_final", as: :mark_office_handover_form_as_final
  resources :office_release_items
  post "/office_releases/mark_as_final/:id" => "office_releases#mark_as_final"
  resources :office_releases
  resources :office_purchase_entry_items
  resources :office_purchase_entries
  post '/office_purchase_entries/mark_as_final/:id' => "office_purchase_entries#mark_as_final", as: :mark_ope_as_final
  resources :purchase_order_items
  resources :purchase_orders
  post '/purchase_orders/marked_as_final/:id' => "purchase_orders#mark_as_final", as: :mark_po_as_final
  resources :demand_items
  resources :demands
  post '/demands/mark_as_final/:id' => "demands#mark_as_final", as: :mark_demand_as_final
  resources :office_item_entries
  resources :office_items
  resources :personnels
  resources :items
  resources :item_categories, except: [:show]
  resources :fiscal_years
  resources :offices
  devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions'
  }
  resources :users

  def blank
    render 'layouts/blank', notice: "Please use menu."
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
