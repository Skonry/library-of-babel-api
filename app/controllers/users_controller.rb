class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:register]
  
  def register 
    if User.exists?(email: params[:email])
      response = {
        error: {
          message: 'An account for the specified email address already exists.',
          title: 'Email already exists'
        }
      }
      return json_response(response)
    end
    user = User.create(user_params)
    user.shelves << Shelf.create(name: 'Read')
    user.shelves << Shelf.create(name: 'Currently reading')
    user.shelves << Shelf.create(name: 'Want to read')
    command = AuthenticateUser.call(params[:email], params[:password])
    if command.success?
      response = {
        auth_token: command.result[:jwt], 
        user: user.as_json(except: [:password_digest]) 
      }
      json_response(response, 201)
    else
      response = {
        error: {
          message: 'Invalid credentials'
        }
      }
      json_response(response, :unauthorized)
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end

end