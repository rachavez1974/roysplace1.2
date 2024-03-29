class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :street_address
      t.string :number
      t.string :city
      t.string :state
      t.integer :zipcode
      t.string :address_type
      t.string :unit_type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
