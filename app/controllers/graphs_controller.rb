class GraphsController < ApplicationController

  def new
    @book = Book.find(params[:book_id])
    @graph = @book.graphs.build
  end

  def create
    byebug
    # book = Book.find(params[:book_id])
    # @graph = book.graphs.create(graph_params)

    # if @graph.valid?
      # render partial: 'canvas'
    # else
      # render json: { error: @graph.errors.messages.to_json }, status: 401
    # end
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
