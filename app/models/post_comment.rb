# frozen_string_literal: true

class PostComment < ApplicationRecord
  include ActionView::RecordIdentifier

  has_ancestry ancestry_format: :materialized_path2

  belongs_to :user
  belongs_to :post
  belongs_to :creator, class_name: 'User', optional: true

  validates :content, presence: true, length: { minimum: 3 }

  before_validation :ensure_creator

  after_create_commit :broadcast_create
  after_destroy_commit :broadcast_destroy

  private

  def ensure_creator
    self.creator ||= user
    self.user    ||= creator
  end

  def broadcast_create
    if parent.present?
      broadcast_append_to(
        [post, :comments],
        target: dom_id(parent, :children),
        partial: 'post_comments/post_comment',
        locals: { post_comment: self }
      )
    else
      broadcast_prepend_to(
        [post, :comments],
        target: dom_id(post, :comments),
        partial: 'post_comments/post_comment',
        locals: { post_comment: self }
      )
    end
  end

  def broadcast_destroy
    broadcast_remove_to([post, :comments], target: dom_id(self))
  end
end
