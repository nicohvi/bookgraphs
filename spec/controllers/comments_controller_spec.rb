require 'rails_helper'

describe CommentsController do

  context 'Graphs' do
    let(:comment) { create :graph_comment }

    it 'Creates a new comment for the graph' do
    end

  end

  context 'Plot points' do
    let(:comment) { create :plot_point_comment }

    it 'Creates a new comment for the plot point' do

    end

  end

end
