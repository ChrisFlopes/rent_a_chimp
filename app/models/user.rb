class User < ApplicationRecord
  has_many :animals
  has_many :bookings

  valdiates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
end
