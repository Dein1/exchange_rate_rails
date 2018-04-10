Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/admin' => 'exchange_rates#edit'
  patch '/admin' => 'exchange_rates#update', as: 'exchange_rate'
  root 'exchange_rates#index'
end
