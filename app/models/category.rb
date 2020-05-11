class Category < ApplicationRecord
  has_many :post_categories
  has_many :posts, through: :post_categories

  validates_presence_of :name
  validates :name, length: { minimum: 5, maximum: 100 }
end
