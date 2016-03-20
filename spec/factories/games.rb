require 'securerandom'

FactoryGirl.define do
  factory :game do
    title Faker::App.name
    votes Faker::Number.between(1, 1000)
  end

  factory :new_game, :class => Game do
    title Faker::App.name
  end
end
