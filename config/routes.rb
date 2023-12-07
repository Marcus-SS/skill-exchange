Rails.application.routes.draw do
  # Hide the /users/sign_in url, and instead redirect to /
  get "/users/sign_in", to: redirect('/')

  devise_for :users
  devise_scope :user do
    get '/', to: 'devise/sessions#new'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :users
  resources :skills
  resources :learn_skills
  resources :teach_skills
  resources :matches do
    resources :chatrooms, only: [:create]
  end
  resources :chatrooms, only: [:index, :show] do
    resources :messages, only: :create
  end
  # resources :profiles


  get "/profile/edit" => "profile#edit", as: :profile_edit
  patch "/profile" => "profile#update", as: :profile_update
  get "/profile" => "profile#show", as: :profile_show
  get "/profile/:id/show" => "profile#other", as: :profile_other

  # For partial updates
  # resources :profiles, only: [:index, :update]
  post "/profile/partial-update", to: "profile#partial_update"
end
