class Brand < ActiveRecord::Base
  has_many :brands_stores, dependent: :destroy
  has_many :stores, through: :brands_stores
end
