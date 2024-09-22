# frozen_string_literal: true

class PostComment < ApplicationRecord
  has_ancestry

  belongs_to :user
  belongs_to :post
  has_many :comments, foreign_key: :parent_id
end
