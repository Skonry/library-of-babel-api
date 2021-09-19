class ApplicationController < ActionController::API
  before_action :authenticate_request

  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_handler

  attr_reader :current_user

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    response = {
      error: {
        message: 'Unauthorized request'
      }
    }
    json_response(response, 401) unless @current_user
  end

  def json_response(response, status = :ok)
    render json: response, status: status
  end

  def unprocessable_entity_handler(exception)
    json_response(ValidationErrorsSerializer.new(exception.record).serialize, :unprocessable_entity)
  end

  
end