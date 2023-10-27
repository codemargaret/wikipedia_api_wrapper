Rails.application.routes.draw do
  get 'most_viewed_yesterday', to: 'api_results#index', as: 'yesterday'

  get 'most_viewed_last_week', to: 'results_aggregators#most_viewed_last_week', as: 'last_week'

  get 'most_viewed_last_month', to: 'results_aggregators#most_viewed_last_month', as: 'last_month'

  resources :article_stats, param: :title
end
