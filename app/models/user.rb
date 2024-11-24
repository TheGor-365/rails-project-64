# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :likes, class_name: 'PostLike', dependent: :destroy
  has_many :comments, class_name: 'PostComment', dependent: :destroy
end
