class PostsController < ApplicationController
  def new
  end

  def create
    @post = Post.new(post_params)
    if @post.update(post_params)
      flash[:success] = "Post guardado correctamente"
      redirect_to posts_new_path(@post)
    else
      flash[:danger] = "Error al guardar Post"
      redirect_to posts_new_path(@post)
    end
  end

  def view
  end

  def edit
  end

  private
    # Valido los campos permitidos
    def post_params
      params.require(:post).permit(:title, :description, :img_id)
    end
end
