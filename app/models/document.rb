class Document < ApplicationRecord
  belongs_to :portfolio, optional: true # TODO: Remove this
end
