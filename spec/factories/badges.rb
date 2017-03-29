require 'faker'
FactoryGirl.define do

  #A simple badge
  factory :badge do
    name        Faker::App.name
    badge_type ["contribution","reinforcement","dissemination","login"].sample
    description Faker::Lorem.paragraph
    association :project
  end


end
