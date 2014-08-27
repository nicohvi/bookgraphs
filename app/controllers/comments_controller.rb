class CommentsController < ApplicationController

  def create
    params[:graph_id] ? parent = Graph.find(params[:graph_id]) : parent = PlotPoint.find(params[:plot_point_id])

    comment = parent.comments.create(comment_params)
    if comment.valid?
      render json: comment
    else
      render json: { error: comment.errors.messages.to_json }, status: 401
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :body)
  end

end
