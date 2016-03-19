require 'securerandom'

FactoryGirl.define do
  factory :game do
    title Faker::App.name
    votes Faker::Number.between(1, 1000)
    status 'ownit'
  end
end
