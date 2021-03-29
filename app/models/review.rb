class Review < ApplicationRecord

  validates :username, presence: true, uniqueness: true
  validates :title, presence: true
  validates_length_of :content, minimum: 25, maximum: 250
  validates :location_city, presence: true
  validates :location_country, presence: true
  validates_inclusion_of :rating, in: 1..5

end