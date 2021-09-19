class ShelvesController < ApplicationController
  def index
    shelves = @current_user.shelves
    json_response(ShelfSerializer.new(shelves).serialized_json)
  end

  def create
    shelf = Shelf.create(shelf_params)
    json_response(ShelfSerializer.new(shelf).serialized_json, 201)
  end

  def show
    shelf = Shelf.find(params[:shelf_id])
    json_response(ShelfSerializer.new(shelf).serialized_json)
  end

  def update
    shelf = Shelf.find(params[:shelf_id])
    shelf.update!(shelf_params)
    json_response(ShelfSerializer.new(shelf).serialized_json)
  end

  def destroy
    shelf = Shelf.find(params[:shelf_id])
    shelf.destroy!
    json_response({}, 204)
  end

  private

  def shelf_params
    params.from_jsonapi.require(:shelf)
      .permit(:name)
      .merge(user_id: @current_user.id)
  end
end
