class AddColumnSectionToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :section, :integer
  end
end
