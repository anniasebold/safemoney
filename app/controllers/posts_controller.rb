class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save 
      redirect_to @post 
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    if params[:search].present?
      @pagy, @post = pagy(Post.search(params[:search]))
    else
      @pagy, @post = pagy(Post.ordered_by_created_at)
    end

    @categories = Category.order(created_at: :desc)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else 
      render :edit
    end
  end

  def destroy
    post = Post.find_by_id(params[:id])
    Post.destroy(post.id)

    redirect_to root_url 
  end


  private 

  def post_params
    params.require(:post).permit(:title, :text, :image, category_ids: [])
  end

end
