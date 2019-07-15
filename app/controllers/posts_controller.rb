class PostsController < ApplicationController
  def new
  end


  def upload(uploaded_io)
    @name = SecureRandom.uuid + File.extname(uploaded_io)
    File.open(Rails.root.join('public', 'uploads', @name), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    return @name
  end

  def create
    @post = Post.new(post_params)
    params[:post][:img_name] = upload(params[:post][:img_name])

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
      params.require(:post).permit(:title, :description, :img_name)
    end
end
