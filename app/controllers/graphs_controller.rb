class GraphsController < ApplicationController

  def new
    @graph = Graph.new
  end

  def create
    book = Book.find(params[:book_id])
    @graph = book.graphs.create(graph_params)

    if @graph.valid?
      redirect_to @graph
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
    params.require(:graph).permit(:name, :description)
  end

end
