# frozen_string_literal: true

class AddCreatorToPostComments < ActiveRecord::Migration[7.2]
  def change
    unless column_exists?(:post_comments, :creator_id)
      add_reference :post_comments,
                    :creator,
                    null: true,
                    foreign_key: { to_table: :users }
    else
      change_column_null :post_comments, :creator_id, true
      add_foreign_key :post_comments, :users, column: :creator_id unless foreign_key_exists?(:post_comments, :users, column: :creator_id)
      add_index :post_comments, :creator_id unless index_exists?(:post_comments, :creator_id)
    end
  end
end
