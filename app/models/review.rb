class Review < ApplicationRecord
  belongs_to :booking
  include ActiveModel::Conversion
  extend  ActiveModel::Naming

  validates :content, presence: true, length: { minimum: 20 }
  validates :rating, presence: true, numericality: { only_integer: true }
  validates :rating, inclusion: { in: [1, 2, 3, 4, 5],
                                  message: "Rating must be between 1 and 5" }
end
