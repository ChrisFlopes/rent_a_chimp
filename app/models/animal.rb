class Animal < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :bookings
  has_many :reviews, through: :bookings

  mount_uploader :photo, PhotoUploader

  validates :name, presence: true
  validates :species, presence: true, inclusion: {  in: %w[Chimp Dog Cat Camel],
                                                    message: "%{value} is not a valid species" }
  validates :age, presence: true, numericality: { only_integer: true }
end
