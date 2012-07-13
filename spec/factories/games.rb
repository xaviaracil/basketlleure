# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game do
    local_id 1
    visitor_id 1
    date "2012-07-12 22:25:26"
    local_score 1
    visitor_score 1
  end
end
