# frozen_string_literal: true

class AddLikesCountToPosts < ActiveRecord::Migration[7.2]
  def up
    add_column :posts, :likes_count, :integer, null: false, default: 0

    execute <<~SQL
      UPDATE posts
      SET likes_count = (
        SELECT COUNT(*)
        FROM post_likes
        WHERE post_likes.post_id = posts.id
      )
    SQL
  end

  def down
    remove_column :posts, :likes_count
  end
end
