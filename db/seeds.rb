# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
class Seed
  def self.begin
    seed = Seed.new
    seed.generate_reviews
  end

  def generate_reviews
    20.times do |i|
      review = Review.create!(
        username: Faker::Books::Dune.unique.character, 
        title: Faker::Books::Dune.saying, 
        content: Faker::Lorem.paragraph(sentence_count: 4), 
        location_city: Faker::Books::Dune.city,
        location_country: Faker::Books::Dune.planet,
        rating: Faker::Number.between(from: 1, to: 5))
    end
  end
end
Seed.begin
p "Created #{Review.count} reviews."