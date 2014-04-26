NUClass::Application.routes.draw do
  
  root to: "sessions#new"

  resources :courses do
    resources :questions
  end

  resource :session



root 'courses#index'



end
