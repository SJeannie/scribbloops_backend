class PortfoliosWarpController < ApplicationWarpController
  def index
    user = User.find(current_user.id)

    yield user.portfolios
  end

  def show
    portfolio = Portfolio.find(params[:id])

    yield portfolio, include: [:documents]
  end

  def create
    user = User.find(current_user.id)
    portfolio = Portfolio.create(name: params["portfolio"]["name"])
    user.portfolios << portfolio

    yield portfolio
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:name, :id)

  end
end