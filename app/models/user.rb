class User < ApplicationRecord
  extend Enumerize
  
  has_many :posts
  validates_presence_of :email, :name, :education
  
  enumerize :education, in: { elementary_school_incomplete: 0, elementary_school_complete: 1, high_school_incomplete: 2, 
    high_school_complete: 3, graduation_incomplete: 4, graduation_complete: 5, postgraduate_incomplete: 6, postgraduate_complete: 7 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :avatar
end
