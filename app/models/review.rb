class Review < ApplicationRecord

  belongs_to :book
  belongs_to :user

  validates :content, presence: true
  validates_uniqueness_of :user_id, :scope => [:book_id], :message => 'User already have review connected with this book'

end
