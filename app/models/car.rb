class Car < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations
  has_one_attached :image

  validates :name, presence: true, length: { maximum: 20 }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :seats, presence: true, numericality: { only_integer: true }
  validates :extras, presence: true, length: { maximum: 500 }
  validates :image, presence: true, content_type: { in: %w[image/jpeg image/png] }
  validates :type, presence: true
  validates :color, presence: true
  validates :doors, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :transmission, presence: true
  validates :mileage, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :bags, presence: true
end
