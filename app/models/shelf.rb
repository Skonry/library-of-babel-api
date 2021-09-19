class Shelf < ApplicationRecord
  
  has_and_belongs_to_many :user_books

  validates_uniqueness_of :name, :scope => [:user_id], :message => 'User already have shelf with this name'
end
