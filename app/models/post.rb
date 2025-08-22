# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: 'User'

  has_many :comments, class_name: 'PostComment', dependent: :destroy
  has_many :likes, class_name: 'PostLike', dependent: :destroy
  has_many :likers, through: :likes, source: :user

  validates :title, length: { minimum: 4, maximum: 255 }
  validates :title, presence: true
  validates :body, length: { minimum: 20, maximum: 4000 }
  validates :body, presence: true
end
