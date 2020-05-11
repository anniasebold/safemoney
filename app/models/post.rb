class Post < ApplicationRecord
  belongs_to :user
  has_many :post_categories
  has_many :categories, through: :post_categories

  validates_presence_of :title, :text, :categories
  validates :title, length: { minimum: 5, maximum: 255 }
  
  scope :ordered_by_created_at, -> { 
    order(created_at: :desc) 
  }

end
