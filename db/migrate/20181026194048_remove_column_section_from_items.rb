class RemoveColumnSectionFromItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :items, :section
  end
end
