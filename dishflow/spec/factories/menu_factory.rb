FactoryBot.define do
  factory :menu do
    sequence(:name) { |n| "Menu#{n}" }
    # sequence(:description) { |n| "description#{n}"}
  end
end
