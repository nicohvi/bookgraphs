class GraphsController < ApplicationController

  def new
    @book = Book.find(params[:book_id])
    @graph = @book.graphs.build
  end

  def create
    @book = Book.find(params[:book_id])
    @graph = @book.graphs.create(graph_params)
    if @graph.valid?
      redirect_to @book
    else
      render 'new'
    end
  end

  def show
    @graph = Graph.find(params[:id])
  end

  def destroy
    book = Book.find(params[:book_id])
    graph = book.graphs.find(params[:id])

    graph.destroy
    redirect_to book
  end

  private

  def graph_params
    params.require(:graph)
      .permit(:name, :description, :plot_points_attributes => [:name, :description, :x, :y])
  end

end
