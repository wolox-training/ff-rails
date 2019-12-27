FactoryBot.define do
  factory :user do
    alphanumeric_password = Faker::Alphanumeric.alphanumeric 15

    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { alphanumeric_password }
    password_confirmation { alphanumeric_password }
    sequence(:email) { |n| "test_user#{n}@wolox.com.ar".downcase }
  end
end
