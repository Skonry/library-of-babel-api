class UserBooksController < ApplicationController  
  def index
    user_books = @current_user.user_books
    json_response(UserBookSerializer.new(user_books, {include: [:book]}).serialized_json)
  end
  
  def create
    user_book = UserBook.create(user_book_params)
    json_response(UserBookSerializer.new(user_book, {include: [:book]}).serialized_json, 201)
  end

  def show
    user_book = UserBook.find(params[:id])
    json_response(UserBook.new(user_book, {include: [:book]}).serialized_json)
  end

  def update
    user_book = UserBook.find(params[:id])
    user_book.update!(user_book_params)
    json_response(UserBookSerializer.new(user_book, {include: [:book]}).serialized_json)
  end

  def destroy
    user_book = UserBook.find(params[:id])
    user_book.destroy
    json_response({}, 204)
  end

  private

  def user_book_params
    params.from_jsonapi.require(:user_book)
      .permit(:user_rating, :book_id, :shelf_ids)
      .merge(user_id: @current_user.id)
  end
end