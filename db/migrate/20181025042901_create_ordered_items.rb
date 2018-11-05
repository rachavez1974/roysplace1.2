class CreateOrderedItems < ActiveRecord::Migration[5.1]
  def change
    create_table :ordered_items do |t|
      t.integer :item_number
      t.integer :quantiy
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
