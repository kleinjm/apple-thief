class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :weight
      t.integer :value
      t.string :photo_url

      t.timestamps
    end
  end
end
