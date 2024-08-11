# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: 'User'

  has_many :post_comments, class_name: 'PostComment'

  validates :title, length: { minimum: 5, maximum: 255 }
  validates :title, presence: true
  validates :body, length: { minimum: 200, maximum: 4000 }
  validates :body, presence: true
end
