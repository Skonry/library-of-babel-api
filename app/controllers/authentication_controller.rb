class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])
    if command.success?
      response = {
        auth_token: command.result[:jwt], 
        user: command.result[:user].as_json(except: [:password_digest]) 
      }
      json_response(response)
    else
      response = {
        error: {
          message: 'Invalid credentials',
          title: 'Invalid credentials'
        }
      }
      json_response(response, :unauthorized)
    end
  end

end