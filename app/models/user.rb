class User < ApplicationRecord

  has_secure_password
  
  has_many :user_books
  has_many :books, through: :user_books

  has_many :shelves
  
  has_many :reviews
  
end
