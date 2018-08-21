class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    # pegar um único post
    @post = Post.find(params[:id])
  end

  def create
    # render plain: params[:post].inspect
    # Post - vai representar o modelo
    @post = Post.new(post_params)

    # salvar
    if (@post.save)
      # vai carregar o show view.
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if (@post.update(post_params))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  # definimos uma obrigatoriedade agora para o modelo
  private def post_params
    params.require(:post).permit(:title, :body)
  end
end
