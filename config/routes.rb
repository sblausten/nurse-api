Rails.application.routes.draw do
  resources :nurses,
    :constraints => {id: /[0-9]+/, first_name: /[A-Za-z]+/, second_name: /[A-Za-z]+/},
    :path => "/api/nurses",
    :except => [:new, :edit]
end
