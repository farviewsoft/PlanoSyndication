Rails.application.routes.draw do
  resources :syndications,    only: :show
end
