class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :reservations, dependent: :destroy
  has_many :cars, dependent: :destroy

  validates :name, presence: true, length: { maximum: 20 }

  def jwt_payload
    super.merge('foo' => 'bar')
  end
end
