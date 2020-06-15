Rails.application.routes.draw do
  resources :episodes do
    patch :toggle_completed, on: :member
    collection do
      get 'completed', to: "episodes#index", scope: "completed"
      get 'uncompleted', to: "episodes#index", scope: "uncompleted"
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "episodes#index"
end
