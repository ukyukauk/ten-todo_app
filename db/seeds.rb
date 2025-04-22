# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

yuka = User.create!(email: 'yuka@sample.com', password: '111111')
john = User.create!(email: 'john@sample.com', password: 'password')
emily = User.create!(email: 'emily@sample.com', password: 'password')

# boards
yuka.boards.create!(
  name: Faker::Lorem.sentence(word_count: 5),
  description: Faker::Lorem.sentence(word_count: 10)
)

john.boards.create!(
  name: Faker::Lorem.sentence(word_count: 5),
  description: Faker::Lorem.sentence(word_count: 10)
)

emily.boards.create!(
  name: Faker::Lorem.sentence(word_count: 5),
  description: Faker::Lorem.sentence(word_count: 10)
)

# tasks
10.times do
  yuka.tasks.create!(
    board: Board.all.sample,
    name: Faker::Lorem.sentence(word_count: 5),
    description: Faker::Lorem.sentence(word_count: 100),
    deadline: Time.zone.local(2025, 5, 1, 15, 30)
  )
end

10.times do
  john.tasks.create!(
    board: Board.all.sample,
    name: Faker::Lorem.sentence(word_count: 5),
    description: Faker::Lorem.sentence(word_count: 100),
    deadline: Time.zone.local(2025, 6, 1, 15, 30)
  )
end

10.times do
  emily.tasks.create!(
    board: Board.all.sample,
    name: Faker::Lorem.sentence(word_count: 5),
    description: Faker::Lorem.sentence(word_count: 100),
    deadline: Time.zone.local(2025, 7, 1, 15, 30)
  )
end

# comments
20.times do
  yuka.comments.create!(
    task: Task.all.sample,
    content: Faker::Lorem.sentence(word_count: 50)
  )
end

20.times do
  john.comments.create!(
    task: Task.all.sample,
    content: Faker::Lorem.sentence(word_count: 50)
  )
end

20.times do
  emily.comments.create!(
    task: Task.all.sample,
    content: Faker::Lorem.sentence(word_count: 50)
  )
end
