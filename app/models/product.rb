class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category, dependent: :destroy
  # belongs_to :brand, dependent: :destroy, optional: true
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :status
  belongs_to_active_hash :size
  belongs_to_active_hash :delivery
  validates :price, :cost, :prefecture_id, :delivery_id, :size_id , :status_id, presence: true
  validates :name, presence: true, length: {maximum: 30}
  validates :description, presence: true, length: {maximum: 140}
  validates :images,presence: true
  def self.search(search)
    if search != ""
      Product.where('name LIKE(?)', "%#{search}%")
    else
      Product.all
    end
  end
end

