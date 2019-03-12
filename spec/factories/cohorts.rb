FactoryBot.define do
  factory :cohort do
    sequence(:name) { |n| "#{n}"}
    sequence(:cohort_id) { |n| "blah#{n}"}
  end
end
