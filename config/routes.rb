Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "authentication/sessions" }
  root to: 'site#welcome'

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