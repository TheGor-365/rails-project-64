class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :likes, class_name: 'PostLike'
  has_many :comments, class_name: 'PostComment'
end
