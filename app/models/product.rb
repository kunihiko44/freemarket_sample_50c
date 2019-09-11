class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :delivery_cost
  belongs_to_active_hash :delivery_method
  belongs_to_active_hash :delivery_date
  belongs_to :category
  belongs_to :user

  has_many :images

  mount_uploader :image, ImageUploader

  validates :name,:introduction,:price,:category,:state,:delivery_cost,:prefecture,:delivery_method,:delivery_date, presence: true
  validates :name,length:{ maximum: 40 }
  validates :introduction,length:{ maximum: 1000 }
  validates :price, numericality:{ greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

end
