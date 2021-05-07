Rails.application.routes.draw do

  resources :users do
    resources :hobbies
    resources :books
  end
  get '/hobbies/all', to: 'hobbies#all'
  get '/books/all', to: 'books#all'
  
end
