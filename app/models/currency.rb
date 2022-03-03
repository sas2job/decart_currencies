class Currency < ApplicationRecord
  validates :name, :rate, presence: true
end
