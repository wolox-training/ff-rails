50_000.times do
  Book.create(
    genre: Faker::Book.genre,
    author: Faker::Book.author,
    image: Faker::Internet.url(host: 'wolox.com.ar', path: '/image.jpg'),
    title: Faker::Book.title.truncate(25),
    editor: Faker::Book.publisher,
    year: Faker::Number.between(from: 0, to: 2019)
  )
end
