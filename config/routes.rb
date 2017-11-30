Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "authentication/sessions" }
  devise_scope :user do
    authenticated :user do
      root "acts#index", as: :authenticated_root
    end
    unauthenticated do
      root to: 'site#welcome', as: :unauthenticated_root
    end
  end

  namespace :admin do
    get "/", to: "site#panel", as: "root"
    resources :acts
    resources :act_types
    resources :users
    resources :targets do
      resources :target_categories do
        resources :target_subcategories
      end
    end
    resources :organizations do
      resources :organization_groups do
        resources :organizations_subgroups
      end
    end
  end

  resources :acts do
    collection do 
      get "filter"
      post "advance_search"
    end
    resources :act_organizations, only:[] do
      member do
        get "update_organizations"
      end
    end
    resources :act_targets, only:[] do
      member do
        get "update_targets"
      end
    end
  end
  resources :categories
end