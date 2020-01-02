FactoryBot.define do
  factory :book_suggestion do
    synopsis { Faker::Lorem.paragraph }
    price { Faker::Number.decimal(l_digits: 2, r_digits: 3) }
    author { Faker::Book.author }
    link { Faker::Internet.url(host: 'wolox.com.ar', path: '/image.jpg') }
    title { Faker::Book.title }
    editor { Faker::Book.publisher }
    year { Faker::Number.between(from: 0, to: 2019) }
    user { create(:user) }
  end
end
