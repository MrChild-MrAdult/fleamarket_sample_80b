class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category, dependent: :destroy
  belongs_to :brand, dependent: :destroy, optional: true
  has_many :images, dependent: :destroy

  accepts_nested_attributes_for :images, allow_destroy: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :price, :cost, :prefecture_id, :delivery_day, :size , :status, presence: true
  validates :name, presence: true, length: {maximum: 30}
  validates :description, presence: true, length: {maximum: 140}
  validates :images,presence: true
end