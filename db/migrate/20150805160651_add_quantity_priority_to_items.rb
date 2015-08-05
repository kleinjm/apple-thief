class AddQuantityPriorityToItems < ActiveRecord::Migration
  def change
    add_column :items, :priority, :integer
    add_column :items, :quantity, :integer
  end
end
