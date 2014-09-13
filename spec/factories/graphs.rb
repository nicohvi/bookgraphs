FactoryGirl.define do

  factory :graph do
    book
    name 'Excitement'
    description 'The graph of this book\'s excitement.'
    svg 'svg'

    after(:build) do |graph|
      5.times do
        graph.plot_points << create(:plot_point, graph: graph)
      end
    end

  end

end
