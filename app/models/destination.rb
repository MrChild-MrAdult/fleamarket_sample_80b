class Destination < ApplicationRecord
  belongs_to :user, optional: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :family_name, :first_name, :family_name_kana, :first_name_kana, :post_code, :prefecture_id, :city, :address, presence: true
end
