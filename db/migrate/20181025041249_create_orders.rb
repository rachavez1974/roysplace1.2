class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.decimal :tax_rate
      t.decimal :sub_total
      t.decimal :total
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
