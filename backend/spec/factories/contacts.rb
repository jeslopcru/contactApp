# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    email { Faker::Internet.unique.email }
    first_name { Faker::Books::Dune.character }
    last_name { Faker::Books::Dune.character }
    phone { Faker::PhoneNumber.cell_phone_in_e164 }
  end
end
