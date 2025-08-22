# frozen_string_literal: true

class RelaxCreatorNullOnPostComments < ActiveRecord::Migration[7.2]
  def up
    change_column_null :post_comments, :creator_id, true
  end

  def down
    change_column_null :post_comments, :creator_id, false
  end
end
