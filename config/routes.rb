Rails.application.routes.draw do
  resources :oauth_configs
  resources :apps
  resources :questions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Errors Routes
  match '/403', to: 'errors#forbidden', via: [:delete, :get, :patch, :post, :put], as: :forbidden
  match '/404', to: 'errors#file_not_found', via: [:delete, :get, :patch, :post, :put], as: :file_not_found
  match '/422', to: 'errors#unprocessable', via: [:delete, :get, :patch, :post, :put], as: :unprocessable
  match '/500', to: 'errors#internal_server_error', via: [:delete, :get, :patch, :post, :put], as: :internal_server_error

  # Locale Scope
  scope 'locale' do
    get 'change/:country' => 'localize#change', as: :locale_change
    get 'states_from/:country' => 'localize#states_from', as: :states_from
    get 'cities_from/:country/:state' => 'localize#cities_from', as: :cities_from
  end

  # DeviseUser sessions
  devise_for :users,
             controllers: {
               unlocks: 'users/unlocks',
               sessions: 'users/sessions',
               passwords: 'users/passwords',
               registrations: 'users/registrations',
               confirmations: 'users/confirmations',
               omniauth_callbacks: 'users/omniauth_callbacks'
             }

  # Not Persistence actions
  get 'dashboard' => 'dashboard#index', as: :dashboard
  get 'recent_videos' => 'dashboard#recent', as: :recent_videos
  get '/users/delete_account' => 'profiles#delete_account', as: :delete_account
  get '/terms' => 'terms#index', as: :terms
  get '/policy' => 'terms#policy', as: :policy

  # Persistence Actions
  resources :roles
  resources :profiles
  # resources :experiences
  resources :subscriptions, only: [:new, :create]
  resources :courses do
    # resources :admin_courses
    resources :periods do
      resources :lessons
    end
  end

  # Root route
  # root to: 'dashboard#index'
  root to: 'dashboard#recent'
end
