Rails.application.routes.draw do
  devise_for :admin
  devise_for :customer
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "public/homes#top"

  namespace :admin do
    resources :genres, only: [:index, :update, :create, :edit ]
    resources :items, only: [:index, :update, :create, :edit, :show, :new ]
    resources :customers, only: [:index, :update, :edit, :show ]
    resources :orders, only: [:update, :show ]
    resources :order_details, only: [:update ]
    get '/' => 'admin/homes#top'
  end
end
