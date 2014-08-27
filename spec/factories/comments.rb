FactoryGirl.define do

  factory :graph_comment, class: Comment do
    graph
    name 'Frank the Third'
    body 'This comment is totally revolutionairy.'
  end

  factory :plot_point_comment, class: Comment  do
    plot_point
    name 'Frank the Fourth'
    body 'This comment is okay.'
  end

end
