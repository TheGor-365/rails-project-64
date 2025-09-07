# # frozen_string_literal: true

# class PagesController < ApplicationController
#   def home
#     @posts = Post.includes(:creator, :category, :likes).order(created_at: :desc)
#   end
# end
# frozen_string_literal: true

class PagesController < ApplicationController
  def posts
    @posts = Post.includes(:category, :creator).order(id: :desc)
  end
end
