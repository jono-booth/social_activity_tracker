FactoryGirl.define do
  factory :social_activity do
    factory :laugh_page_view do
      value 1
      sequence(:user_ip) { |n| "192.1.1.#{n}" }
    end
  end
end
