class Car < ApplicationRecord
  belongs_to :user

  has_many :reservations, dependent: :destroy

  validates :car_model, presence: true
  validates :car_type, presence: true
  validates :price_per_day, presence: true, numericality: { only_integer: true }
  validates :transmission, presence: true
  validates :description, presence: true
  validates :photo, presence: true
end
