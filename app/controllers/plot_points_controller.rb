class PlotPointsController < ApplicationController

  def create
    graph = Graph.find(params[:graph_id])
    plot_point = graph.plot_points.create(plot_point_params)

    if plot_point.valid?
      render json: plot_point
    else
      render json: { error: plot_point.errors.messages.to_json }, status: 401
    end
  end

  private

  def plot_point_params
    params.require(:plot_point).permit(:name, :page, :description)
  end

end
