class Book < ApplicationRecord

  has_many :user_books
  has_many :users, through: :user_books

  has_many :reviews

  has_one_attached :cover

  attr_accessor :cover_url

end
