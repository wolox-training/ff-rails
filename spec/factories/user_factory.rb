FactoryBot.define do
  factory :user do
    alphanumeric_password = Faker::Alphanumeric.alpha 10
  
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { alphanumeric_password }
    password_confirmation { alphanumeric_password }
    email { "#{first_name}.#{last_name}@wolox.com.ar".downcase }
  end
end
