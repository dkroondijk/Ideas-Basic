class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    idea = Idea.find(params[:idea_id])
    like = current_user.likes.new
    like.idea = idea

    if like.save
      redirect_to root_path, notice: "Liked!"
    else
      redirect_to root_path, notice: "Can't Like!"
    end

  end

  def destroy
    like = current_user.likes.find(params[:id])
    like.destroy
    redirect_to root_path
  end
end
