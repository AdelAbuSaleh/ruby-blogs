Rails.application.routes.draw do
  root to: 'home_pages#home'

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
