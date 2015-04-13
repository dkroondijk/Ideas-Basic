class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @idea = Idea.find(params[:idea_id])
    @comment = current_user.comments.new(comment_params)
    @comment.idea = @idea

    if @comment.save
      redirect_to @idea
    else
      redirect_to @idea
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
