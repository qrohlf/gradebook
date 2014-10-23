Rails.application.routes.draw do


  get '/students/stats.json' => 'students#stats'

  resources :assignments do
    member do
      get 'graph_data'
    end
  end
  resources :students do
    resources :submissions
  end

  get '/auth/google_oauth2/callback' => 'auth#google_oauth2'
  get '/logout' => 'auth#logout'
  get '/submissions' => 'submissions#index'

  root 'students#index'
end
