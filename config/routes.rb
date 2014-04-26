NUClass::Application.routes.draw do
  
  resources :students do
    member do
      get "schedule", to: "students#schedule"
      post "add_courses", to: "students#add_courses"
    end
  end
end
