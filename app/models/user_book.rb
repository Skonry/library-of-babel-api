class UserBook < ApplicationRecord
  belongs_to :book
  belongs_to :user
  has_and_belongs_to_many :shelves  
end