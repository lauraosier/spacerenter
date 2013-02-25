
FactoryGirl.define do
  factory :space, :class => Refinery::Spaces::Space do
    sequence(:owner) { |n| "refinery#{n}" }
  end
end

