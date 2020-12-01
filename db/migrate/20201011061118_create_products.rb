class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :price, null: false
      t.string :cost, null: false
      t.integer :status_id, null: false
      t.integer :size_id, null: false
      t.string :description, null: false
      t.integer :prefecture_id, null: false
      t.integer :delivery_id, null: false
      t.string :judgment
      t.references :user, forenign_key: true
      t.references :category, forenign_key: true
      t.string :brand
      t.timestamps
    end
  end
end