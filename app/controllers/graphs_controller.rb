class GraphsController < ApplicationController

  def show
    @graph = Graph.find(params[:id])
  end

  def destroy
    book = Book.find(params[:book_id])
    graph = book.graphs.find(params[:id])

    graph.destroy
    redirect_to book
  end

end
