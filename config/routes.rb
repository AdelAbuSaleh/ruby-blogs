Rails.application.routes.draw do
  resources :categories
  namespace :admin do
    resources :users
  end
  root to: 'home_pages#home'

  get 'signup' => 'admin/users#new'
  post 'signup' => 'admin/users#create'
  get 'adminlogin' => 'admin/sessions#new'
  post 'adminlogin' => 'admin/sessions#create'
  delete 'logout' => 'admin/sessions#destroy'

  # get 'about' => 'home_pages#about'
  # get '/contact' => 'home_pages#contact'
  get  '/about', to: 'home_pages#about'
  resources :posts
  # resources :home_pages, only: [] do
  #   post :contact, on: :collection
  # end
  post 'contact' => 'home_pages#contact'
  get 'contact' => 'home_pages#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
