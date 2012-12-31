class CommentsController < ApplicationController
  def create
    @problem = Problem.find(params[:problem_id])
    @comment = @problem.comments.new(params[:comment])
    @comment.user = current_user
    @comment.save
    redirect_to problem_path(@problem)
  end
end
