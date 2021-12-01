class Article < ApplicationRecord
  belongs_to :user

  has_many :article_categories
  has_many :categories, through: :article_categories

  validates :title, presence: true, length: { minimum: 6, maximum: 100 } # makes sure title is present in order for articl to be saved
  validates :description, presence: true, length: { minimum: 10, maximum: 350 }
  
end
