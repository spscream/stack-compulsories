Rails.application.routes.draw do
  root to: 'compulsories#index'
    resources :compulsories
end
