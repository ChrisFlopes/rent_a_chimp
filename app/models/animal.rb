class Animal < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings

  valdiates :name, presence: true
  validates :species, presence: true, inclusion: {  in: %w[Chimp Dog Cat Camel],
                                                    message: "%{value} is not a valid species" }
  valdiates :age, presence: true, numericality: { only_integer: true }
end
