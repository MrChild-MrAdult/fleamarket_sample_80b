class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :url, null: false
      # product_idには後で外部キーをつける
      t.integer :product_id, null: false
      t.timestamps
    end
  end
end
