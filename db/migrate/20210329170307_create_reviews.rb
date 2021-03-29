
class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :username
      t.string :title
      t.string :content
      t.string :location_city
      t.string :location_country
      t.integer :rating
    end
  end
end