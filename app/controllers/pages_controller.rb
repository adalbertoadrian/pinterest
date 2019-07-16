class PagesController < ApplicationController
  def index
    @posts = Post.all
  end

  def contact
  end
end
