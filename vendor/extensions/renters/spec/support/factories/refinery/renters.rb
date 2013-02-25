
FactoryGirl.define do
  factory :renter, :class => Refinery::Renters::Renter do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

