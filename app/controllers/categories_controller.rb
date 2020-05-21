class CategoriesController < ApplicationController
  def show
    @categorie = Category.find(params[:id])
    @post = @categorie.posts.order(created_at: :desc)
    @categories = Category.order(created_at: :desc)
  end
end
