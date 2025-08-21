# frozen_string_literal: true

class AddIndexOnPostCommentsAncestry < ActiveRecord::Migration[7.2]
  def change
    add_index :post_comments, :ancestry, if_not_exists: true
  end
end
