require 'rails_helper'

describe GraphsController do
  let(:graph) { create :graph }
  let(:book) { graph.book }

  it 'Creates an associated graph for a book' do
    graph_params = { name: 'Tears shed', description: 'I cried during this book.' }

    post :create, graph: graph_params, book_id: book
    expect(assigns(:graph).name).to eq('Tears shed')
    expect(assigns(:graph).description).to eq('I cried during this book.')
  end

  it 'Doesn\'t create an invalid graph' do
    post :create, graph: { nothing: 'empty' }, book_id: book
    expect(assigns(:graph).errors.messages.length).to eq(2)
    expect(response).to render_template('new')
  end

  it 'Deletes an associated graph from a book' do
    delete :destroy, id: graph, book_id: book
    expect { Graph.find(graph) }.to raise_error
    expect(response).to redirect_to book
  end

  describe 'Plot points' do
    before { 5.times { graph.plot_points << create(:plot_point) } }

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
