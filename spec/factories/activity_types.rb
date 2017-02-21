require 'faker'
FactoryGirl.define do
  factory :activity_type do
    name Faker::Beer.hop
  end
end
