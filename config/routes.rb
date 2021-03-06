Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :orders, only: [:index, :show, :create, :destroy]
  resources :products do
    resources :comments
  end

  get 'static_pages/about'

  get 'static_pages/contact'
  post 'static_pages/thank_you'

  get 'static_pages/index'
  root 'static_pages#landing_page'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
