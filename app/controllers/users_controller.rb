class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])
  end

  def details
    @user = User.find_by_id(params[:id])
    @post = @user.posts.order(created_at: :desc)
  end
end
