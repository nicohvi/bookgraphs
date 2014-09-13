require 'rails_helper'

describe GraphsController do
  let(:graph) { create :graph }
  let(:book) { graph.book }

  it 'Deletes an associated graph from a book' do
    delete :destroy, id: graph, book_id: book
    expect { Graph.find(graph) }.to raise_error
    expect(response).to redirect_to book
  end

  describe 'Plot points' do
    it 'Lists all plot points associated with a graph' do
      get :show, book_id: book, id: graph
      expect(assigns(:graph).plot_points.length).to eq(5)
    end

    it 'Deletes all plot points for a graph when it\'s deleted' do
      delete :destroy, book_id: book, id: graph
      expect(PlotPoint.all).to be_empty
    end

  end

  describe 'Comments' do
    before { 5.times { graph.comments << create(:graph_comment) } }

    it 'Lists all comments associated with a graph' do
      get :show, book_id: book, id: graph
      expect(assigns(:graph).comments.length).to eq(5)
    end

    it 'Deletes all comments for a graph when it\'s deleted' do
      delete :destroy, book_id: book, id: graph
      expect(Comment.all).to be_empty
    end

  end

end
