# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table(:posts) do |t|
      t.string(:title)
      t.text(:body)
      t.references(:category, null: false, foreign_key: true)
      t.references(:creator, index: true, null: false, foreign_key: { to_table: :users })

      t.timestamps
    end
  end
end
