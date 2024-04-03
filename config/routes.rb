Rails.application.routes.draw do
  resources :rounds
  resource :course, only:[:show,:edit,:update] 

  namespace :scheduled do
      resources :game, only:[:show,:edit,:update] do 
        member do
          get :form_teams
          patch :update_teams
          patch :toggle_pays
          get :set
          patch :update_players

        end
      end
      resource :about, only:[:show]
  end
  namespace :pending do
      resources :game, only:[:show,:edit,:update] do
        member do
          get :score_teams
          patch :update_scores
          get :adjust_teams
          get :swap_teams
          patch :update_teams
          get :set

        end

      end


      resources :score, only:[:show,:edit,:update]
      resource :about, only:[:show]

  end
  namespace :scored do
      resources :game, only:[:show,:edit,:update] do
        member do
          get :skins
          patch :update_skins
          get :par3s
          patch :update_par3s

        end

      end
      resources :par3, only:[:show,:edit,:update]
      resources :skins, only:[:show,:edit,:update]
      resource :about, only:[:show]
  end

  # resources :schedules ,only:[:show,:update] do
  #     member do
  #       get :form_teams
  #     end
  # end
  resources :users
  resources :games 
  resources :players do
    member do
      get :recompute_quota
    end
    collection do
      patch :search
      get :player_search
      post :pairings_search
      # get :quota_correction
      # get :add_correction
    end

  end
  resources :groups do
    member do 
      patch :visit
    end
  end
  resource :session 
  resource :password, only:[:edit,:update]
  resource :profile, only:[:edit,:update,:show]


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  # resources :players
  # resources :users
  # resources :groups
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get 'visit', to: 'home#visit'

  root "home#index"
  get '*path', to: 'home#redirect'

end
