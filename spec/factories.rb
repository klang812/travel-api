FactoryBot.define do
  factory(:review) do
    username {Faker::Books::Dune.unique.character}
    title {Faker::Books::Dune.saying}
    content {Faker::Lorem.paragraph(sentence_count: 4)}
    location_city {Faker::Books::Dune.city}
    location_country {Faker::Books::Dune.planet}
    rating {Faker::Number.between(from: 1, to: 5)}
  end
end
