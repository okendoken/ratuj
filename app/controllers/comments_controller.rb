class CommentsController < ApplicationController

  before_filter :authenticate_user!

  def create
    @problem = Problem.find(params[:problem_id])
    @comment = @problem.comments.new(params[:comment])
    @comment.user = current_user
    @comment.save
    redirect_to problem_path(@problem)
  end

  def destroy
    @problem = Problem.find(params[:problem_id])
    @comment = @problem.comments.find(params[:id])
    @comment.destroy
    redirect_to problem_path(@problem)
  end
end
