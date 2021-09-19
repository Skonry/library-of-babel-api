class BookSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :title, :author, :rating, :description
  
  attribute :cover_url do |object|
    Rails.application.routes.default_url_options[:host] = 'localhost:3001'
    Rails.application.routes.url_helpers.rails_blob_url(object.cover)
  end
end
