class FavoritesController < ApplicationController

  def new
    favorite = Favorite.new
  end

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(favorite_params)

    if @favorite.save
      redirect_to root_url
    else
      render :new
    end

  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find(params[:id])

    redirect_to root_url
  end

  private

  def favorite_params
    params.require(:favorite).permit(:favorite, :post_id)
  end

end
