class Destination < ApplicationRecord
  belongs_to :user, optional: true
  validates :family_name, :first_name, :family_name_kana, :first_name_kana, :post_code, :prefecture, :city, :address, presence: true
end
