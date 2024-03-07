# frozen_string_literal: true

FactoryBot.define do
  factory :classroom do
    number { Faker::Number.number(digits: 2) }
    letter { 'A' }
    school
  end
end
