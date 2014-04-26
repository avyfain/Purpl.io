NUClass::Application.routes.draw do
  


  resources :courses do
    resources :questions do
      resources :answers, only: [:create]
      resources :survey_results 
    end
  end

  resources :students do
    member do
      get "schedule", to: "students#schedule"
      post "add_courses", to: "students#add_courses"
    end
  end

  # root to: "sessions#new"

 

  resource :session



root 'sessions#new'

end
