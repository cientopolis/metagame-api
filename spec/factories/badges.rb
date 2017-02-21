require 'faker'
FactoryGirl.define do

  #A simple badge
  factory :badge do
    name        Faker::App.name
    description Faker::Lorem.paragraph
    association :project
    association :type, factory: :activity_type
  end


end
