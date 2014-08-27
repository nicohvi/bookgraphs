require 'rails_helper'

describe GraphsController do
  before {
    @book = create :book
    5.times { @book.graphs << create(:graph) }
  }

  it 'Deletes an associated graph from a book' do
    delete :destroy, id: @book.graphs.last, book_id: @book
    expect { Graph.find(@book.graphs.length) }.to raise_error
    expect(response).to redirect_to @book
  end

  describe 'Plot points' do
    before {
      @graph = @book.graphs.last
      5.times { @graph.plot_points << create(:plot_point) }
    }

    it 'Lists all plot points associated with a graph' do
      get :show, book_id: @book, id: @graph
      expect(assigns(:graph).plot_points.length).to eq(5)
    end

    it 'Deletes all ploit points for a graph when it\'s deleted' do
      delete :destroy, book_id: @book, id: @graph
      expect(PlotPoint.all).to be_empty
    end

  end

end
