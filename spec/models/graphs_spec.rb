require 'rails_helper'

describe Graph do

  let(:graph) { create :graph }

  it 'Doesn\'t save a graph with no plot points' do
    graph.plot_points.delete_all
    expect{ graph.save! }.to raise_error
  end

end
