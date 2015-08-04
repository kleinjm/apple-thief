class CreateBags < ActiveRecord::Migration
  def change
    create_table :bags do |t|
      t.string :name
      t.text :description
      t.integer :capacity
      t.string :photo_url

      t.timestamps
    end
  end
end
