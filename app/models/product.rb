class Product < ApplicationRecord
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  validates :title, :description, :image_url, :price, presence: true
  validates :title, uniqueness: true, length: { minimum: 10 }
  validates :image_url, format: { with: %r{\.(gif|jpg|png)\z}i, message: 'must be a GIF, JPG or PNG Image.'}
  validates :price, numericality: {greater_than_or_equal_to: 0.01}

  private

  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line Items present')
      throw :abort
    end
  end
end
