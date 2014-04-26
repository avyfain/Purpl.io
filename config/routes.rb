NUClass::Application.routes.draw do
  
  resources :students do
    member do
      get "schedule", to: "students#schedule"
      post "add_courses", to: "students#add_courses"
    end
  end

<<<<<<< HEAD
  # root to: "sessions#new"

=======
>>>>>>> 703be7b5a77e707158bdba78835f77ff233100f0
  resources :courses do
    resources :questions
    resources :survey_results 
  end

  resource :session



root 'courses#index'

end
