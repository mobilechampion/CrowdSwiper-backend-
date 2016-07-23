Rails.application.routes.draw do
  # devise_for :users, controllers: { sessions: "users/sessions" }
  # devise_for :users

  mount_devise_token_auth_for 'User', at: 'users', controllers: {
      sessions:  'overrides/sessions',
      registrations: 'overrides/registrations'
  }

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#home'

  resources :articles, except: [:new, :edit, :destroy] do
    collection do
      get 'queue'
      get 'favorites'
    end
  end

  get '/users/:id/submit_articles', to: "articles#submit_articles"

  get '/pages/home', to: 'pages#home', as: :before_start
  get '/pages/user', to: 'pages#user', as: :user_api
  get '/pages/article', to: 'pages#article', as: :article_api

  get 'users/:id/information', to: 'users#show', as: :user_info

  post 'users/oauth/facebook', to: "users#fb_oauth", as: :fb_oauth

  post 'users/oauth/google', to: "users#google_oauth", as: :google_oauth

  post 'articles/:id/like', to: "favorites#like", as: :like
  post 'articles/:id/unlike', to: "favorites#unlike", as: :unlike
  post 'articles/:id/vote', to: "votes#create", as: :vote


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
