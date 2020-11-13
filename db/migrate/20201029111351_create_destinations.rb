class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string  :family_name,       null:false
      t.string  :first_name,      null:false
      t.string  :family_name_kana,  null:false
      t.string  :first_name_kana, null:false
      t.integer :post_code,     null:false
      t.integer :prefecture_id, null: false
      t.string  :city,            null:false
      t.string  :address,  null:false
      t.string  :building_name
      t.string  :phone_number      
      t.references :user, forenign_key: true
      t.timestamps
    end
  end
end
    
      

