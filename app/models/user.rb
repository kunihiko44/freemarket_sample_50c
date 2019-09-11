class User < ApplicationRecord
  has_one :name
  has_many :product
end