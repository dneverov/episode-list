Rails.application.routes.draw do
  resources :episodes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "episodes#index"
end
