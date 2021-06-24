class User < ApplicationRecord
  has_many :posts
  has_many :post_tags, through: :posts

  validates :name, presence: true, uniqueness: true
end