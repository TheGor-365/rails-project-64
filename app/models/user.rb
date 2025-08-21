# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :posts, class_name: 'Post', foreign_key: :creator_id, inverse_of: :creator, dependent: :destroy
  has_many :likes, class_name: 'PostLike', dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_many :comments, class_name: 'PostComment', dependent: :destroy
end
