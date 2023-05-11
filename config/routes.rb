Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root to: "homes#top"
    get 'about' => "homes#about"
    get 'items' => 'items#index'
    get '/items/:id' => 'items#show'
    get '/customers/my_page' => 'customers#show'
    get '/customers/information/edit' => 'customers#edit'
    patch '/customers' => 'customers#update'
    get '/customers/confirm' => 'customers#confirm'
    patch '/customers/withdraw' => 'customers#withdraw'
    get '/cart_items' => 'cart_items#index'
    patch '/cart_items/:id' => 'cart_items#update'
    delete '/cart_items/:id' => 'cart_items#destroy'
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    post '/cart_items' => 'cart_items#create'
    get '/orders/new' => 'orders#new'
    post '/orders/confirm' => 'orders#confirm'
    get '/orders/complete' => 'orders#complete'
    post '/orders' => 'orders#create'
    get '/orders' => 'orders#index'
    get '/orders/:id' => 'orders#show'
  end

  namespace :admin do
    root to: "homes#top"
    resources :items, only: [:index, :new, :create, :show, :edit]
    patch '/items/:id' => 'items#update'
    resources :customers, only: [:index, :show, :edit]
    patch '/customers/:id' => 'customers#update'
    get '/orders/:id' => 'orders#show'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
