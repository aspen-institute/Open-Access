Rails.application.routes.draw do
  namespace :admin do
    resources :pages

    resources :navigation_links
    resources :home_sections
    resources :page_references
    resources :system_settings


    resources :users
    resources :roles

    root to: "pages#index"
  end

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :image_upload

  get 'editor/link', action: :link, controller: 'editor'
  post 'editor/image', action: :image, controller: 'editor'

  # Defines the root path route ("/")
  root "home#index"

  get '*path', to: 'page#show'
end
