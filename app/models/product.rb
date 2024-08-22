class Product < ApplicationRecord
  validates :title, :description, :image_url, :price, presence: true
  validates :title, uniqueness: true
  validates :image_url, format: { with: %r{\.(gif|jpg|png)\z}i, message: 'must be a GIF, JPG or PNG Image.'}
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
end
