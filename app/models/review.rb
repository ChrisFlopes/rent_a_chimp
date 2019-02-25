class Review < ApplicationRecord
  belongs_to :booking

  validates :content, presence: true
  validates :rating, presence: true, numericality: { only_integer: true }
  validates :rating, inclusion: { in: [1, 2, 3, 4, 5],
                                  message: "%{value} is not a valid species" }
end
