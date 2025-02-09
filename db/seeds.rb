# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

return if User.exists? && Test.exists? && Category.exists?

users = User.create!([
                      { first_name: 'Steve', last_name: 'Jobs',
                        email: 'abcnicenme@gmail.com', password: '123456', type: 'Admin',
                        confirmation_token: 'pUzjpCCFDVSuc21xU23s', confirmed_at: '2025-01-16 13:30:09.429851', confirmation_sent_at: '2025-01-16 13:30:04.889953' }
                    ])

categories = Category.create!([
  { title: "Backend" }
])

tests =  Test.create!([
  { title: "Ruby", level: 1, category: categories[1], author: users[0] },
  { title: "Rails", level: 2, category: categories[1], author: users[0]}
])

questions = Question.create!([
  { body: "What is the name of a specialized data type in the Ruby language?", test: tests[0] },
  { body: "What does ORM stand for?", test: tests[1] }
])

answers = Answer.create!([
  { body: "Symbols", question: questions[0] },
  { body: "Object Relational Mapper", question: questions[1] }
])
