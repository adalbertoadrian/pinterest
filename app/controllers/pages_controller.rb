class PagesController < ApplicationController
  def index
      @posts = Post.all.order(:id)
  end

  def contact
  end
end
