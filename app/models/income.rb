class Income < ApplicationRecord
  has_many :income_values, dependnent: :destroy
end
