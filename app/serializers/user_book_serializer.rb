class UserBookSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_rating

  belongs_to :book
end
