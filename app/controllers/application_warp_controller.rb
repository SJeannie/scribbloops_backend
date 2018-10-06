class ApplicationWarpController < WarpCable::Controller
  # before_action :authorized

  def encode_token(payload)
    JWT.encode(payload, 'app_wide_secret_for_every_user')
  end

  def decoded_token
    if auth_header
      token = auth_header.split[1]

      begin
        JWT.decode(token, 'app_wide_secret_for_every_user', true, algorithm: 'HS256')

      rescue JWT::DecodeError
        nil
      end
    end
  end

  def current_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    raise 'Please log in' unless logged_in?
  end

end