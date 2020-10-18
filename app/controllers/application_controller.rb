class ApplicationController < ActionController::API
  before_action :authorized

  def build_jwt
  end

  def encode_token(payload)
    JWT.encode(payload, Rails.application.secret_key_base)
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, Rails.application.secret_key_base, true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def current_user
    logged_in_user
  end

  def logged_in_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      password = decoded_token[0]['password']
      @user = User.find_by(id: user_id)
      @user.pswd = password
      @user
    end
  end

  def logged_in?
    !!logged_in_user
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end

end
