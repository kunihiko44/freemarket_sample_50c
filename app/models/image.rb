class Image < ApplicationRecord
  belongs_to :product

  mount_uploader :name, ImageUploader

  validates :name, presence: true
  validates :product_id, presence: true

end
