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
      5.times do { @graph.plot_points << create(:plot_point) }
    }

  end

end
