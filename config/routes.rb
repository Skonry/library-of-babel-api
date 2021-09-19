Rails.application.routes.draw do

  post 'register', to: 'users#register'
  post 'authenticate', to: 'authentication#authenticate'

  resources :user_books, except: [:new, :edit]

  resources :shelves, except: [:new, :edit]

  #get 'user-reviews', to: 'reviews#user_reviews' 

  resources :books, except: [:new, :edit]
  resources :reviews, except: [:new, :edit]
  
end
