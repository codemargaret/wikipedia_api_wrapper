Rails.application.routes.draw do
  # resources :api_results

  get 'most_viewed_yesterday', to: 'api_results#index', as: 'yesterday'
end
