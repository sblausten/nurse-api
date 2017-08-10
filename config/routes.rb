Rails.application.routes.draw do
  resources :nurses,
    constraints: {id: /[0-9]+/},
    path: '/api/nurses',
    except: [:new, :edit]
  get '/api/nurses/:first_name/:last_name', to: 'nurses#show',
    constraints: {first_name: /[A-Za-z]+/, second_name: /[A-Za-z]+/}
  put '/api/nurses/:first_name/:last_name', to: 'nurses#update',
    constraints: {first_name: /[A-Za-z]+/, second_name: /[A-Za-z]+/}
  delete '/api/nurses/:first_name/:last_name', to: 'nurses#destroy', 
    constraints: {first_name: /[A-Za-z]+/, second_name: /[A-Za-z]+/}
end
