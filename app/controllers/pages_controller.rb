# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @posts = Post.includes(:creator, :category, :likes).order(id: :desc)
  end
end
