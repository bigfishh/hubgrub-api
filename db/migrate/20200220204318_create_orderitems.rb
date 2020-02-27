class CreateOrderitems < ActiveRecord::Migration[6.0]
  def change
    create_table :orderitems do |t|
      t.belongs_to :restitem, null: false, foreign_key: true
      t.belongs_to :order, null: false, foreign_key: true
      t.integer :price

      t.timestamps
    end
  end
end
