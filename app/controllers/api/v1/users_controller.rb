class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    user = User.new(user_params)
    byebug

    # render json: {
    #   user: user,
    #   token: encode_token({user_id: user.id})
    # }
    # @user = User.create(user_params)
    if @user.valid?
      render json: { user: UserSerializer.new(@user) }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted

    byebug

  end



  private
  def user_params
    byebug
    params.require(:user).permit(:username, :password)
  end


end
