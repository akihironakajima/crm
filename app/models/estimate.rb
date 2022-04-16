class Estimate < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :address, presence: true, length: { maximum: 255 }
  validates :tel, presence: true, length: { maximum: 255 }
end