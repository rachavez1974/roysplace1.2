class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :item_name
      t.text :description
      t.decimal :price, precision: 8, scale: 2
      t.string :modifiers
      t.string :menu
      t.string :section
      t.boolean :availability

      t.timestamps
    end
  end
end
