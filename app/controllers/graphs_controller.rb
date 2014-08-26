class GraphsController < ApplicationController

  def destroy
    book = Book.find(params[:book_id])
    graph = book.graphs.find(params[:id])

    graph.destroy
    redirect_to book
  end

end
