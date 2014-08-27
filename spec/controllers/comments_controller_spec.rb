require 'rails_helper'

describe CommentsController do
  let(:graph) { create :graph }

  context 'Graphs' do
    it 'Creates a new valid comment for the graph' do
      comment_params = { name: 'Frank', body: 'Comment.' }
      post :create, comment: comment_params, graph_id: graph

      parsed_body = JSON.parse(response.body)
      expect(parsed_body['name']).to eq('Frank')
      expect(parsed_body['body']).to eq('Comment.')
    end

    it 'Doesn\'t create a new invalid comment for the graph' do
      post :create, comment: { nothing: 'empty' }, graph_id: graph

      parsed_body = JSON.parse(response.body)
      expect(parsed_body['error']).to_not be_nil
    end

  end

  context 'Plot points' do
    let(:plot_point) { create :plot_point }

    it 'Creates a new valid comment for the plot point' do
      comment_params = { name: 'Frank', body: 'Comment.' }
      post :create, comment: comment_params, graph_id: graph, plot_point_id: plot_point

      parsed_body = JSON.parse(response.body)
      expect(parsed_body['name']).to eq('Frank')
      expect(parsed_body['body']).to eq('Comment.')
    end

  end

end
