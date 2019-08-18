FactoryBot.define do
  factory :food do
    sequence(:name) { |n| "Food#{n}" }
    sequence(:description) { |n| "description#{n}"}
  end
end 
