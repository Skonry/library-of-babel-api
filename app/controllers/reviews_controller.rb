class ReviewsController < ApplicationController
  skip_before_action :authenticate_request, only: [:index, :show]
  
  def index
    reviews = filteredReviews
    json_response(ReviewSerializer.new(reviews, {include: [:user]}).serialized_json)
  end

  def user_reviews
    reviews = @current_user.reviews
    json_response(ReviewSerializer.new(reviews).serialized_json)
  end

  def create
    review = Review.create!(review_params)
    json_response(ReviewSerializer.new(review).serialized_json, 201)
  end

  def show
    review = Review.find(params[:id])
    json_response(ReviewSerializer.new(review).serialized_json)
  end

  def update
    review = Review.find(params[:id])
    review.update!(review_params)
    json_response(ReviewSerializer.new(review).serialized_json)
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy!
    json_response({}, 204)
  end

  private

  def review_params
    params.from_jsonapi.require(:review)
      .permit(:content, :book_id)
      .merge(user_id: @current_user.id)
  end

  def filteredReviews
    if params[:filter] and params[:filter][:book]
      Review.where(book_id: params[:filter][:book])
    elsif params[:filter] and params[:filter][:user]
      Review.where(user_id: params[:filter][:user])
    else
      Review.all
    end
  end 
end
