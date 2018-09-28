class User < ApplicationRecord
  has_many :user_portfolios
  has_many :portfolios, through: :user_portfolios
end
