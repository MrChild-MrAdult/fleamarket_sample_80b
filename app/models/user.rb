class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_day, :email, presence: true
  has_many :products, dependent: :destroy
  has_one :destination, dependent: :destroy
  has_one :credit_card, dependent: :destroy

  # 購入者・出品者の商品
  # has_many :buyed_products, foreign_key: "buyer_id", class_name: "Product"
  # has_many :saling_products, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Product"
  # has_many :sold_products, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Product"
end
