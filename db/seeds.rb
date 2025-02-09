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

# users = User.create!([
#   { first_name: "Alexander", email: "alexander1999@mail.com", password: "123456" },
#   { first_name: "Anna", email: "anna2003@mail.com", password: "123456" },
#   { first_name: "Georgy", email: "georgy2001@mail.com", password: "123456" },
#   { first_name: "Artem", email: "artem2005@mail.com", password: "123456" },
#   { first_name: "Ekaterina", email: "ekaterina2000@mail.com", password: "123456" }
#   ])

users = User.create!([
                      { first_name: 'Steve', last_name: 'Jobs',
                        email: 'abcnicenme@gmail.com', password: '123456', type: 'Admin',
                        confirmation_token: 'pUzjpCCFDVSuc21xU23s', confirmed_at: '2025-01-16 13:30:09.429851', confirmation_sent_at: '2025-01-16 13:30:04.889953' }
                    ])

categories = Category.create!([
  { title: "Frontend" },
  { title: "Backend" },
  { title: "Data Science" },
  { title: "Machine learning" },
  { title: "Mobile development" },
  { title: "Math searching" }
])

tests =  Test.create!([
  { title: "Ruby", level: 1, category: categories[1], author: users[0] },
  { title: "Rails", level: 2, category: categories[1], author: users[0]},
  # { title: "HTML", level: 1, category: categories[0], author: users[0] },
  # { title: "CSS", level: 1, category: categories[0], author: users[0] },
  # { title: "JavaScript", level: 2, category: categories[0], author: users[0] },
  # { title: "R", level: 2, category: categories[2], author: users[0] },
  # { title: "C/C++", level: 3, category: categories[2], author: users[0] },
  # { title: "Python", level: 2, category: categories[3], author: users[0] },
  # { title: "Java", level: 2, category: categories[4], author: users[0] },
  # { title: "Kotlin", level: 1, category: categories[4], author: users[0] },
  # { title: "Fortran", level: 3, category: categories[5], author: users[0] },
  # { title: "Matlab", level: 3, category: categories[5], author: users[0] }
])

questions = Question.create!([
  { body: "What is the name of a specialized data type in the Ruby language?", test: tests[0] },
  { body: "What does ORM stand for?", test: tests[1] },
  # { body: "What encoding should use on the site?", test: tests[2] },
  # { body: "What does CSS stand for?", test: tests[3] },
  # { body: "Where is the correct place to insert a JavaScript?", test: tests[4] },
  # { body: "In R, you must declare the data type of a variable?", test: tests[5] },
  # { body: "C++ is an alias of C#?", test: tests[6] },
  # { body: "Which collection does not allow duplicate members?", test: tests[7] },
  # { body: "Java is short for JavaScript?", test: tests[8] },
  # { body: "Which keyword is used to declare a function?", test: tests[9] },
  # { body: "Is Fortran interpreter type language?", test: tests[10] },
  # { body: "Which commands are used to display the content of the workspace?", test: tests[11] }
])

answers = Answer.create!([
  { body: "Symbols", question: questions[0] },
  { body: "Object Relational Mapper", question: questions[1] },
  # { body: "UTF-8", question: questions[2] },
  # { body: "Cascading Style Sheets", question: questions[3] },
  # { body: "Body", question: questions[4] },
  # { body: "No", question: questions[5] },
  # { body: "No", question: questions[6] },
  # { body: "Set", question: questions[7] },
  # { body: "No", question: questions[8] },
  # { body: "Fun", question: questions[9] },
  # { body: "Yes", question: questions[10] },
  # { body: "Who", question: questions[11] }
])
