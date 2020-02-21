class CreateRestitems < ActiveRecord::Migration[6.0]
  def change
    create_table :restitems do |t|
      t.belongs_to :item, null: false, foreign_key: true
      t.belongs_to :restaurant, null: false, foreign_key: true
      t.integer :price

      t.timestamps
    end
  end
end
