Rails.application.routes.draw do
  devise_for :customer,skip: [:passwords,], controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }


  scope module: :customer do
    get '/unsubscribe' => 'customers#unsubscribe'
    get '/my_page' => 'customers#show'
    root 'homes#top'
    get '/about', to: 'homes#about'
    resources :items, only: [:index, :show ]
    resource :customers, only: [ :update, :edit ] do
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
    get '/admin' => 'admin/homes#top'


end
