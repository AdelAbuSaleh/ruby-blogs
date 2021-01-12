Rails.application.routes.draw do
  root to: 'home_pages#home'

  get 'about' => 'home_pages#about'
  get 'contact' => 'home_pages#contact'

  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
