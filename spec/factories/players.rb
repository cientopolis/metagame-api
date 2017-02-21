require 'faker'
FactoryGirl.define do
  factory :player do
    email Faker::Internet.email
  end
end
