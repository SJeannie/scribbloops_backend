class ApplicationController < ActionController::API

  def encode_token(payload)
    JWT.encode(payload, 'app_wide_secret_for_every_user')
  end


  def decoded_token(token)
    JWT.decode(token, 'app_wide_secret_for_every_user')[0]
  end

end
