# メルカリDB

## usersテーブル
|Column|Type|Options|
|------|-----|------|
|nickname|string|null:false|
|introduction|text|null: true|
|icon|string|null: true|
|email|string|null:false,unique:true|
|password|string|null:false|

### Assosiation
has_one :user_detail, dependent: :destroy  
has_one :user_address, dependent: :destroy  
has_one :credit_card, dependent: :destroy  
has_many :comments, dependent: :destroy  
has_many :reviews, dependent: :destroy  
has_many :products, dependent: :destroy 
has_many :likes, dependent: :destroy  
has_many :orders, dependent: :destroy  

## user_detailsテーブル
|Column|Type|Options|
|------|-----|------|
|first_name|string|null:false|
|last_name|string|null:false|
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|birthday|string|null:false|
|phone_number|string|null:false|
|user_id|references|foreign_key: true, null:false|

### Assosiation
belongs_to :user  

## user_addressesテーブル
|Column|Type|Options|
|------|-----|------|
|postcode|string|null:false|
|prefecture|interger|null:false|
|city|string|null:false|
|block|string|null:false|
|building_name|string|null: true|
|user_id|references|foreign_key: true, null:false|

### Assosiation
belongs_to :user  

## credit_cardsテーブル
|Column|Type|Options|
|------|-----|------|
|card_number|integer|null:false|
|card_month|integer|null: false|
|card_year|integer|null: false|
|security_code|integer|null: false|
|user_id|references|foreign_key: true, null:false|

### Assosiation
belongs_to :user  

## commentsテーブル
|Column|Type|Options|
|------|-----|------|
|content|text|null: false|
|user_id|references|foreign_key: true, null: false|
|product_id|references|foreign_key: true, null: false|
|product_deal|string|null: false|

### Assosiation
belongs_to :user  
belongs_to :product



## productsテーブル
|Column|Type|Options|
|------|-----|------|
|name|string|null_false, index:true|
|introduction|text|null: false|
|price|integer|null: false|
|size|string|null: false|
|state|string|null: false|
|user_id|references|foreign_key: true, null: false|
|buyer_id|references|foreign_key: true,null: true|
|brand|references|foreign_key: true|
|category|references|foreign_key: true|
|deal_state|string|nill: true|
|delivery_date|integer|null:false|
|delivery_cost|integer|null:false|
|delivery_method|integer|null:false|
|delivery_prefecture|integer|null:false|

### Assosiation
has_many :comments, dependent: :destroy  
has_many :images, dependent: :destroy  
has_many :likes, dependent: :destroy  
has_many :reviews, dependent: :destroy  
has_one :delivery, dependent: :destroy  
has_one :order  
belongs_to :user  
belongs_to :brand  
belongs_to :category


## imagesテーブル
|Column|Type|Options|
|------|-----|------|
|image|string|null: false|
|product_id|references|foreign_key: true, null:false|

### Assosiation
belongs_to :product


## categoriesテーブル
|Column|Type|Options|
|------|-----|------|
|category|string|null:false, index: true|
|size|string|null: true|
|ancestry|string|null:false|

### Assosiation
has_many :products  
has_ancestry


## brandsテーブル
|Column|Type|Options|
|------|-----|------|
|name|string|null: false, index: true|

### Assosiation
has_many :products

## likesテーブル
|Column|Type|Options|
|------|-----|------|
|user|references|null: false, foreign_key: true|
|product|references|null: false, foreign_key: true|

### Assosiation
belongs_to :user  
belongs_to :product

## ordersテーブル
|Column|Type|Options|
|------|-----|------|
|product_id|references|foreign_key: true, null: false|
|seller_id|references|foreign_key: true, null: false|
|buyer_id|references|foreign_key: true,null: true|
|state|string|null: false|

### Assosiation
belongs_to :user  
belongs_to :product

## reviewsテーブル
|Column|Type|Options|
|------|-----|------|
|review|text|null:false|
|user_id|integer|foreign_key:true,null:false|
|product_id|integer|foreign_key:true,null:false|

### Assosiation
belongs_to :user  
belongs_to :product