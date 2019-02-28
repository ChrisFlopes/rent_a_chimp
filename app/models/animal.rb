class Animal < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :bookings
  has_many :reviews, through: :bookings

  mount_uploader :photo, PhotoUploader

  validates :name, presence: true
  validates :species, presence: true, inclusion: {  in: %w[Chimp Dog Cat Camel],
                                                    message: "%{value} is not a valid species" }
  validates :age, presence: true, numericality: { only_integer: true }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch
  pg_search_scope :search_by_species_and_address,
    against: [:species, :address],
    using: {
      tsearch: { prefix: true }
    }
end
