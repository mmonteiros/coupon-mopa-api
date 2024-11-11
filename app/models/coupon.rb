class Coupon < ApplicationRecord
  validates :code, presence: true, uniqueness: true
  validates :discount, presence: true, numericality: { greater_than: 0 }
end
