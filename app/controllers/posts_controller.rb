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
    @pagy, @post = pagy(Post.ordered_by_created_at)
  end

  private 

  def post_params
    params.require(:post).permit(:title, :text, category_ids: [])
  end

end
