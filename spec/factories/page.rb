FactoryGirl.define do
  factory :page do
    sequence(:url)  { |n| "http://platform45.com/#{n}" }
    sequence(:uuid) { |n| "#{n}" }
    score 50
  end
end
