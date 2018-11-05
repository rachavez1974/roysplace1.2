class RemoveColumnMenuFromItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :items, :menu
  end
end
