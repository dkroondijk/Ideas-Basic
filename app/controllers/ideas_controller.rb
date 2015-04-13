class IdeasController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]


  def index
    @idea = Idea.new
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = current_user.ideas.new(idea_params)

    if @idea.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def show
    @idea = Idea.find(params[:id])
    @comment = Comment.new
    @comments = @idea.comments
  end


  private

  def idea_params
    params.require(:idea).permit(:title, :body, :image)
  end

end
