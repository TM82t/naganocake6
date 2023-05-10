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
    
  end

  namespace :admin do
    root to: "homes#top"
    get 'items' => 'admin/items#index'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
