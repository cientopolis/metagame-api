require 'faker'
FactoryGirl.define do
  factory :project do
    name Faker::Internet.email
  end
end
