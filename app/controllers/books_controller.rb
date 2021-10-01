require 'open-uri'

class BooksController < ApplicationController
  skip_before_action :authenticate_request, only: [:index, :show]

  def index 
    books = Book.all
    json_response(BookSerializer.new(books).serialized_json)
  end

  def create
    params = book_params

    image = Cloudinary::Uploader.upload(params[:cover])

    book = Book.create(params.except(:cover).merge(cover_url: image['url']))
    
    json_response(BookSerializer.new(book).serialized_json, 201)
  end

  def show
    book = Book.find(params[:id])
    json_response(BookSerializer.new(book).serialized_json)
  end

  def update
    book = Book.find(params[:id])

    params = book_params
    if params.key?(:cover)
      image = Cloudinary::Uploader.upload(params[:cover])
      params = params.except(:cover).merge(cover_url: image['url'])
    end

    book.update!(params)
    
    json_response(BookSerializer.new(book).serialized_json)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy!
    json_response({}, 204)
  end

  private

  def book_params
    params.from_jsonapi.require(:book)
      .permit(:title, :author, :cover)
  end
end
