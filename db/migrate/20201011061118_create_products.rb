class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :price, null: false
      t.string :cost, null: false
      t.string :status, null: false
      t.string :size, null: false
      t.string :description, null: false
      t.string :prefecture, null: false
      t.string :delivery_day, null: false
      t.string :judgment
      t.references :user, forenign_key: true
      t.references :category, forenign_key: true
      t.references :brand, forenign_key: true
      t.timestamps
    end
  end
end
