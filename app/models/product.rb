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


  has_many_attached :images

  validates :name,:introduction,:price,:category,:state,:delivery_cost,:prefecture,:delivery_method,:delivery_date, presence: true


end
