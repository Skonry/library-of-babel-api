class ReviewSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :errors
  belongs_to :book
  belongs_to :user
end
