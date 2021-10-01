class BookSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :title, :author, :rating, :description, :cover_url
  
end
