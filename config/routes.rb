NUClass::Application.routes.draw do
  
  # root to: "sessions#new"

  resources :courses do
    resources :questions do
      resources :answers, only: [:create]
    end
  end

  resource :session



root 'courses#index'



end
