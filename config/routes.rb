Rails.application.routes.draw do
  resources :pictures, only: %i[create index show]
end