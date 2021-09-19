class BooksController < ApplicationController
  skip_before_action :authenticate_request, only: [:index, :show]

  def index 
    books = Book.all
    json_response(BookSerializer.new(books).serialized_json)
  end

  def create
    book = Book.create(book_params)
    decoded_data = Base64.decode64(params[:data][:attributes][:cover].split(',')[1])
    book.cover.attach(
      io: StringIO.new(decoded_data),
      filename: 'image.jpg'
    )
    json_response(BookSerializer.new(book).serialized_json, 201)
  end

  def show
    book = Book.find(params[:id])
    json_response(BookSerializer.new(book).serialized_json)
  end

  def update
    book = Book.find(params[:id])
    book.update!(book_params)
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
      .permit(:title, :author)
  end
end
