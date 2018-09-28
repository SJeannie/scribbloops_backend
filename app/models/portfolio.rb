class Portfolio < ApplicationRecord
  has_many :portfolio_documents
  has_many :documents, through: :portfolio_documents
end
