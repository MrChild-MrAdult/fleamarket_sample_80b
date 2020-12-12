# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# team-app

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|birth_day|date|null: false|
|user_img|string|
|introduction|text|
### Association
- has_many :products dependent: :destroy
- has_one :destination dependent: :destroy
- has_one :credit_card dependent: :destroy

## destinationsテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|post_code|string|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|
|phone_number|string|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|customer_id|string|null: false|
|card_id|string|null: false|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|string|null: false|
|cost|string|null: false|
|status_id|string|null: false|
|size_id|string|null: false|
|description|string|null: false|
|prefecture_id|integer|null: false|
|delivery_id|string|null: false|
|judgment|string|
|buyer_id|integer|
|user_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|brand|integer|null: false, foreign_key: true|
### Association
- belongs_to :user 
- belongs_to :category dependent: :destroy
- belongs_to :brand dependent: :destroy, optional: true
- has_many :images dependent: :destroy
- belongs_to :buyer, class_name: "User", optional: true

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|
### Association
- has_many :products

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|index: true|
### Association
- has_many :products

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|url|string|null: false|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :product