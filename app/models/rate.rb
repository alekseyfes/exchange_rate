class Rate < ApplicationRecord
  validates :value, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :from, presence: true
  validates :to, presence: true
end
