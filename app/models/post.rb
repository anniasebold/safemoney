class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :post_categories, dependent: :destroy
  has_many :categories, through: :post_categories

  validates_presence_of :title, :text, :categories
  validates :title, length: { minimum: 5, maximum: 255 }
  
  scope :ordered_by_created_at, -> { 
    order(created_at: :desc) 
  }

  scope :search, -> (search) {
    where('posts.title LIKE :search OR posts.text LIKE :search', search: "%#{search}%")
  }
  
end
