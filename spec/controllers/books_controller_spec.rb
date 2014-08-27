require 'rails_helper'

describe BooksController do
  let(:book1) { create :book }
  let(:book2) { create :book }

  it 'Lists all books when the index action is invoked' do
    get :index
    expect(assigns :books).to match_array [book1, book2]
  end

  it 'Shows the appropriate book when show action is invoked' do
    get :show, id: book1
    expect(assigns :book).to eq(book1)
  end

  it 'Doesn\'t create a new book with invalid params' do
    post :create, book: { nothing: 'empty' }
    expect(assigns(:book).errors.messages.length).to eq(4)
    expect(response).to render_template('new')
  end

  describe 'Graphs' do
    before { 5.times { book1.graphs << (create :graph) } }

    it 'Lists all graphs for a selected book' do
      get :show, id: book1
      expect(assigns(:book).graphs.length).to eq(5)
    end

    it 'Deletes all graphs for a selected book when book is deleted' do
      delete :destroy, id: book1
      expect(Graph.all).to be_empty
      expect(response).to redirect_to root_path
    end
  end

end
