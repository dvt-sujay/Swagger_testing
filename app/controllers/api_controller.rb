class ApiController < ApplicationController
  before_action :authenticate_request

  private

  def authenticate_request
    header = request.headers['Authorization']
    token = header.split(' ').last if header
    decoded_token = JwtService.decode(token)

    unless decoded_token && decoded_token['car_api_user']
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end

