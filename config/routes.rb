NUClass::Application.routes.draw do
  
  resources :students do
    member do
      get "schedule", to: "students#schedule"
      post "add_courses", to: "students#add_courses"
    end
  end

  # root to: "sessions#new"

  resources :courses do
    resources :questions
    resources :survey_results 
  end

  resource :session



root 'courses#index'

end
