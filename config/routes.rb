Rails.application.routes.draw do
  devise_for :admin
  devise_for :customer

  get '/customers/my_page' => 'public/customers#show'
  get '/customers/unsubscribe' => 'public/customers#unsubscribe'

  scope module: :public do
    root 'homes#top'
    get '/about', to: 'homes#about'
    resources :items, only: [:index, :show]
    resources :customers, only: [:show, :edit, :update ] do
        patch :withdraw, on: :collection
    end
    resources :cart_items do
        delete :destroy_all, on: :collection
    end
    resources :orders, only: [:index, :new, :show] do
        post :confirm, on: :collection
        get :complete, on: :collection
        post :create, on: :collection
    end
    resources :addresses, only: [:index, :edit, :create, :update, :destroy ]
  end


  namespace :admin do
    resources :genres, only: [:index, :update, :create, :edit ]
    resources :items, only: [:index, :update, :create, :edit, :show, :new ]
    resources :customers, only: [:index, :update, :edit, :show ]
    resources :orders, only: [:update, :show ]
    resources :order_details, only: [:update ]
  end
    get '/' => 'admin/homes#top'


end
