FactoryGirl.define do

  factory :book do
    sequence(:title) { |n| "The Life and Death of Tim Skellington - Volume #{n}" }
    sequence(:published) { |n| n.years.ago }
    length 500
    author 'Tim Skellington the Fourth'

    factory :invalid_book do
      title 'This Book is Invalid.'
    end
  end

end
