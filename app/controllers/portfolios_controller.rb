class PortfoliosController < ApplicationController
  before_action :authorized

  def index
    user = User.find(current_user.id)

    render json: user.portfolios
  end

  def create
    user = User.find(current_user.id)
    portfolio = Portfolio.create(name: params["portfolio"]["name"])
    user.portfolios << portfolio

    render json: portfolio
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:name)

  end

end