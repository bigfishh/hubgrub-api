class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :restaurant, foreign_key: true
      t.boolean :checked_out, default: false
      t.integer :total, default: 0 

      t.timestamps
    end
  end
end
