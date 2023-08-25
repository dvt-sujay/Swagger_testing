require 'jwt'

class JwtService
  def self.encode(payload)
    JWT.encode(payload, Rails.application.credentials.jwt_secret_key, 'HS256')
  end

  def self.decode(token)
    JWT.decode(token, Rails.application.credentials.jwt_secret_key, true, algorithm: 'HS256').first
  rescue JWT::DecodeError
    nil
  end
end

