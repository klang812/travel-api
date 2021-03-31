class Review < ApplicationRecord
  include Searchable
  enum status: [:active, :inactive]

  validates :username, presence: true, uniqueness: true
  validates :title, presence: true
  validates_length_of :content, minimum: 25, maximum: 250
  validates :location_city, presence: true
  validates :location_country, presence: true
  validates_inclusion_of :rating, in: 1..5

  scope :search_by_username, ->  { where username: username }
  scope :search_by_title, -> (title) { where title: title }
  scope :search_by_location_city, -> (location_city) { where location_city: location_city }
  scope :search_by_location_country, -> (location_country) { where location_country: location_country }

end


# ILIKE%

# returned_projects = DB.exec("SELECT * FROM projects WHERE title ILIKE '%#{title}%';")

# Book.where("location_city ILIKE ?", "%" + params[:location_city] + "%")