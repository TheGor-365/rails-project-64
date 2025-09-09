# frozen_string_literal: true

class PagesController < ApplicationController
  def index
    @posts = Post.includes(:category).order(id: :desc)
  end
end
