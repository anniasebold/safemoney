class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])
  end

  def details
    @user = User.find_by_id(params[:id])
  end
end
