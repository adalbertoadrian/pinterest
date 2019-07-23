class PostsController < ApplicationController
  def new
  end

  def upload(uploaded_io)
    name = SecureRandom.uuid + File.extname(uploaded_io)
    File.open(Rails.root.join('public', 'uploads', name), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    return name
  end

  def create
    post = Post.new(post_params)
    post[:img_name] = upload(params[:post][:img_name])

    if post.save
      flash[:success] = "Post guardado correctamente"
      redirect_to posts_new_path
    else
      flash[:danger] = "Error al guardar Post"
      redirect_to posts_new_path
    end
  end

  def update
    edit = Post.find_by(id: params[:post][:id])
    edit.title = params[:post][:title]
    edit.description = params[:post][:description]
    if edit.save
      flash[:success] = "Post Editado correctamente"
      redirect_to root_path
    end
  end

  def view
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    if Post.destroy(params[:id])
      flash[:success] = "Post Eliminado correctamente"
      redirect_to root_path
    end
  end

  def find
    if params[:search][:find] != ''
      @posts = Post.where("UPPER(title) LIKE ?", params[:search][:find].upcase)
    else
      @posts = Post.all.order(:id)
    end
    render "pages/index"
  end

  private
    # Valido los campos permitidos
    def post_params
      params.require(:post).permit(:title, :description, :img_name)
    end
end
