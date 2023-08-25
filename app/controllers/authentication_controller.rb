class AuthenticationController < ApplicationController
  def authenticate
    # Perform authentication logic here, and if successful, generate a token
    payload = { car_api_user: true }
    token = JwtService.encode(payload)
    render json: { token: token }
  end
end

