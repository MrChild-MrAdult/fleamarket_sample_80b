class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_day, :user_img, :introduction, presence: true
  has_many :products, dependent: :destroy
  has_one :destination, dependent: :destroy
  has_one :credit_card, dependent: :destroy
end
