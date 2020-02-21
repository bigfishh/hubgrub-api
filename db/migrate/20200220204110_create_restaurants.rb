class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.belongs_to :category, null: false, foreign_key: true
      t.string :name
      t.string :latitude
      t.string :longitude
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :street_address
      t.integer :price_rating
      t.string :media_image

      t.timestamps
    end
  end
end
