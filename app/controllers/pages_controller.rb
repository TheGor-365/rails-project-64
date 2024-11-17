# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @posts = Post.order(id: :desc) # rubocop:disable Rails/OrderById
  end
end
