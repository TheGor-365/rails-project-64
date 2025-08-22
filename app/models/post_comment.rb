# frozen_string_literal: true

class PostComment < ApplicationRecord
  has_ancestry ancestry_format: :materialized_path2

  belongs_to :user
  belongs_to :post
  belongs_to :creator, class_name: 'User'

  validates :content, presence: true, length: { minimum: 3 }
end
