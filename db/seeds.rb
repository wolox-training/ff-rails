require 'faker'

50000.times { Book.create(
  genre: Faker::Book.genre,
  author: Faker::Book.author,
  image: Faker::Internet.url(host: 'wolox.com.ar', path: '/image.jpg'),
  title: Faker::Book.title,
  editor: Faker::Book.publisher ,
  year: Faker::Number.between(from: 0, to: 2019) 
  ) }
