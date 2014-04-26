NUClass::Application.routes.draw do

  resources :courses do
    resources :survey_results 
    resources :questions do
      member do
        post "add_upvote", to: "questions#add_upvote"
      end
      resources :answers, only: [:create]
    end
  end

  resources :students do
    member do
      get "schedule", to: "students#schedule"
      post "add_courses", to: "students#add_courses"
    end
  end

  resources :professors do
    member do
      get "schedule", to: "professor#schedule"
      post "add_courses", to: "professor#add_courses"
    end
  end


  # root to: "sessions#new"

  resource :session

root 'sessions#new'

end