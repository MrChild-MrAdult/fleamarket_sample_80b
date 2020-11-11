class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :url, null: false
      t.references :product, forenign_key: true
      t.timestamps
    end
  end
end
