FactoryGirl.define do

  factory :plot_point do
    graph
    sequence(:name) { |n| "When the #{n}#{n == 2 ? 'nd' : 'th'} character dies." }
    description 'It was truly heartbreaking.'
    x 0
    y 0
  end

end
