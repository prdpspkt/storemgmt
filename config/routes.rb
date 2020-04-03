Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  Sidekiq::Web.set :sessions, false

  root "office/offices#index"
  devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions'
  }
  resources :users

  namespace :office do
    resources :vendors, :except => ['show'] do
      collection do
        post "print"
      end
    end

    resources :land_and_structure_record_book_items
    resources :land_and_structure_record_books do
      member do
        post "print"
        post "accept"
      end
    end
    resources :rental_record_register_items
    resources :rental_record_registers do
      member do
        post "print"
        post "accept"
      end
    end
    resources :repair_record_register_items
    resources :repair_record_registers do
      member do
        get "print"
      end
    end
    resources :repair_application_form_items
    resources :repair_application_forms do
      member do
        get "print"
        post "accept"
      end
    end
    resources :stock_items
    resources :stocks do
      collection do
        post "generate"
      end
      member do
        get "print"
        post "accept"
      end
    end
    resources :item_assistance_register_items
    resources :item_assistance_registers do
      member do
        get "print"
      end
    end
    resources :item_evaluation_items
    resources :item_evaluation_committees do
      collection do
        post "create_member"
      end
      member do
        delete "destroy_member"
      end
    end
    resources :item_evaluations do
      collection do
        post "generate"
      end
      member do
        get "print"
        post "accept"
      end
    end
    resources :item_disposal_items
    resources :item_disposals do
      member do
        get "print"
        post "accept"
        post "transaction"
      end
    end
    resources :handover_form_items
    resources :handover_forms do
      member do
        get "print"
        post "accept"
        post "transaction"
      end
    end
    resources :release_items
    resources :releases do
      member do
        get "print"
        post "accept"
        post "transaction"
      end
    end
    resources :purchase_entry_items
    resources :purchase_entries do
      member do
        get "print"
        post "accept"
        post "transaction"
      end
    end

    resources :purchase_order_items
    resources :purchase_orders do
      member do
        get "print"
        post "accept"
        post "entry"
      end
    end

    resources :demand_items
    resources :demands do
      member do
        get "print"
        post "accept"
        post "release"
      end
    end
    resources :items do
      collection do
        post "print"
        post "print_having_stock"
        post "print_having_no_stock"
        post "import"
      end
    end
    resources :personnels do
      collection do
        post "print"
        post "print_working"
        post "print_non_working"
      end
    end
    resources :item_categories do
      collection do
        post "print"
        post "import"
      end
    end
    resources :fiscal_years
    resources :offices do
      collection do
        post "print"
        post "print_suspended"
        post "print_active"
        post "print_project_offices"
        post "print_normal_offices"
      end
    end
    resources :store_bodies
    resources :active_fiscal_year

    resources :ledgers do
      collection do
       get "expense_item_register"
       get "non_expense_item_register"
      end
    end

  end
  ###
  #
  #
  #
  #  ###### PROJECT PART ROUTES
  #
  #
  #
  #
  # #
  namespace :project do
    
    resources :item_evaluation_items
    resources :stock_items
    resources :stocks do
      collection do
        post "generate"
      end
      member do
        get "print"
        post "accept"
      end
    end

    resources :item_evaluations do
      collection do
        post "generate"
      end
      member do
        get "print"
        post "accept"
      end
    end

    resources :handover_form_items
    resources :handover_forms do
      member do
        get "print"
        post "accept"
        post "posting"
      end
    end
    resources :release_items
    resources :releases do
      member do
        get "print"
        post "accept"
        post "transaction"
      end
    end
    resources :purchase_entry_items
    resources :purchase_entries do
      member do
        get "print"
        post "accept"
        post "transaction"
      end
    end
    resources :purchase_order_items
    resources :purchase_orders do
      member do
      get "print"
      post "accept"
      post "entry"
        end
    end

    resources :demand_items
    resources :demands do
      member do
        get "print"
        post "accept"
        post "release"
      end
    end
    resources :items do
      collection do
        get "non_expense_able"
        get "expense_able"
        get "print"
        get "print_stocking"
        post "import"
      end
    end
    resources :tenders do
      member do
        get "print"
        post "accept"
        post "entry"
      end
    end
    resources :tender_items
    resources :item_categories do
      collection do
        post "import"
        get "print"
      end
    end

    resources :projects do
      collection do
        get 'print'
        get 'print_running'
        get 'print_completed'
        post "import"
      end
      member do
        get "demand"
        get "release"
      end
    end

    resources :ledgers do
      collection do
        get "expense_item_registers"
        get "non_expense_item_registers"
      end
      member do
        get "expense_item_register"
        get "non_expense_item_register"
      end
    end

    resources :project_purchase_entry_items
    resources :project_purchase_entries do
      member do
        get "print"
        post "accept"
        post "transaction"
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
