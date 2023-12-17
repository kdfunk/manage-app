Rails.application.routes.draw do
  resources :manages do
    resources :tasks
  end

  # ... other routes ...

  root to: "manages#index"
end
