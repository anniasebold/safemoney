class Post < ApplicationRecord
  belongs_to :user
  has_many :post_categories
  has_many :categories, through: :post_categories

  validates_presence_of :title, :text, :categories
  validates :title, length: { minimum: 5, maximum: 255 }
  
  scope :ordered_by_created_at, -> { 
    order(created_at: :desc) 
  }

  scope :search, -> (search) {
    joins(:categories).where('
             posts.title LIKE :search
             OR posts.text LIKE :search
             OR categories.name LIKE :search', 
             search: "%#{search}%")
  }
  
end
