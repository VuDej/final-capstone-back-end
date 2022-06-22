class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :pick_up_day, presence: true
  validates :return_day, presence: true
  validates :pick_up_city, presence: true, length: { maximum: 25 }
  validates :return_city, presence: true, length: { maximum: 25 }
end
