require 'rails_helper'

describe BooksController do
  before { @book1 = create :book }
  before { @book2 = create :book}

  it 'Lists all books when the index action is invoked' do
    get :index
    expect(assigns :books).to match_array [@book1, @book2]
  end

  it 'Shows the appropriate book when show action is invoked' do
    get :show, id: @book1
    expect(assigns :book).to eq(@book1)
  end

  describe 'Graphs' do
    before { 5.times { @book1.graphs << (create :graph) } }

    it 'Lists all graphs for a selected book' do
      get :show, id: @book1
      expect(assigns(:book).graphs.length).to eq(5)
    end

  end

end
