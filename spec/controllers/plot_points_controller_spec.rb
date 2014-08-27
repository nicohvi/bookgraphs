require 'rails_helper'

describe PlotPointsController do
  let(:graph) { create :graph }

  it 'Creates new valid plot points for a given graph' do
    plot_point_params = { name: 'Edward dies.', page: 1337 }
    post :create, plot_point: plot_point_params, graph_id: graph

    parsed_body = JSON.parse(response.body)
    expect(parsed_body['name']).to eq('Edward dies.')
    expect(parsed_body['page']).to eq(1337)
    expect(parsed_body['graph_id']).to eq(graph.id)
  end

  it 'Returns errors for an invalid plot point' do
    post :create, plot_point: { nothing: 'empty' }, graph_id: graph

    parsed_body = JSON.parse(response.body)
    expect(parsed_body['error']).to_not be_nil
  end

end
