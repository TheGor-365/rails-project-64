# frozen_string_literal: true

class RemoveCreatorFromPostComments < ActiveRecord::Migration[7.2]
  def up
    if column_exists?(:post_comments, :creator_id)
      remove_index :post_comments, column: :creator_id if index_exists?(:post_comments, :creator_id)
      remove_column :post_comments, :creator_id
    end
  end

  def down
    add_reference :post_comments, :creator, null: true, foreign_key: { to_table: :users }
  end
end
