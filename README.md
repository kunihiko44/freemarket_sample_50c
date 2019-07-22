# メルカリDB

## usersテーブル
|Column|Type|Options|
|------|-----|------|
|nickname|string|null:false|
|introduction|text|null: true|
|icon|string|null: true|

### Assosiation
has_one :user_details, dependent: :destroy  
has_one :user_addresses, dependent: :destroy  
has_one :credit_cards, dependent: :destroy  
has_many :points, dependent: :destroy  
has_many :comments, dependent: :destroy  
has_many :products, dependent: :destroy 
has_many :likes, dependent: :destroy  

## user_detailsテーブル
|Column|Type|Options|
|------|-----|------|
|first_name|string|null:false|
|last_name|string|null:false|
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|birthday|string|null:false|
|phonenumber|string|null:false|
|user_id|references|foreign_key: true, null:false|

### Assosiation
belongs_to :user  

## user_addressesテーブル
|Column|Type|Options|
|------|-----|------|
|postcode|string|null:false|
|country_id|interger|null:false|
|city|string|null:false|
|address|string|null:false|
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
|securitycode|integer|null: false|
|user_id|references|foreign_key: true, null:false|

### Assosiation
belongs_to :user  

## commentsテーブル
|Column|Type|Options|
|------|-----|------|
|comment|text|null: false|
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
|product_state|string|null: false|
|seller_id|references|foreign_key: true, null: false|
|buyer_id|references|foreign_key: true,null: true|
|brand|references|foreign_key: true|
|category|references|foreign_key: true|
|deal_state|string|nill: true|

### Assosiation
has_many :comments, dependent: :destroy  
has_many :images, dependent: :destroy  
has_many :likes, dependent: :destroy  
has_one :delivery, dependent: :destroy  
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
|brand_name|string|null: false, index: true|

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