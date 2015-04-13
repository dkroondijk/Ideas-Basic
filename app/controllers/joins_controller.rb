class JoinsController < ApplicationController
  before_action :authenticate_user!

  def create
    idea = Idea.find(params[:idea_id])
    join = current_user.joins.new
    join.idea = idea

    if join.save
      redirect_to root_path, notice: "Joined Idea!"
    else
      redirect_to root_path, notice: "Can't Join!"
    end

  end

  def destroy
    join = current_user.joins.find(params[:id])
    join.destroy
    redirect_to root_path
  end
end
