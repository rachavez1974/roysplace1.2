class AddColumnMenuToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :menu, :integer, after: :price
  end
end
