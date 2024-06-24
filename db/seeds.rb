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
  { name: "Alexander", email: "alexander1999@mail.com" },
  { name: "Anna", email: "anna2003@mail.com" },
  { name: "Georgy", email: "georgy2001@mail.com" },
  { name: "Artem", email: "artem2005@mail.com" },
  { name: "Ekaterina", email: "ekaterina2000@mail.com" }
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
  { title: "Ruby", level: 1, category_id: categories[1].id, author_id: users[0].id },
  { title: "Rails", level: 2, category_id: categories[1].id, author_id: users[0].id },
  { title: "HTML", level: 1, category_id: categories[0].id, author_id: users[1].id },
  { title: "CSS", level: 1, category_id: categories[0].id, author_id: users[1].id },
  { title: "JavaScript", level: 2, category_id: categories[0].id, author_id: users[1].id },
  { title: "R", level: 2, category_id: categories[2].id, author_id: users[3].id },
  { title: "C/C++", level: 3, category_id: categories[2].id, author_id: users[2].id },
  { title: "Python", level: 2, category_id: categories[3].id, author_id: users[2].id },
  { title: "Java", level: 2, category_id: categories[4].id, author_id: users[4].id },
  { title: "Kotlin", level: 1, category_id: categories[4].id, author_id: users[4].id },
  { title: "Fortran", level: 3, category_id: categories[5].id, author_id: users[3].id },
  { title: "Matlab", level: 3, category_id: categories[5].id, author_id: users[3].id }
])

questions = Question.create!([
  { body: "What is the name of a specialized data type in the Ruby language?", test_id: tests[0].id },
  { body: "What does ORM stand for?", test_id: tests[1].id },
  { body: "What encoding should use on the site?", test_id: tests[2].id },
  { body: "What does CSS stand for?", test_id: tests[3].id },
  { body: "Where is the correct place to insert a JavaScript?", test_id: tests[4].id },
  { body: "In R, you must declare the data type of a variable?", test_id: tests[5].id },
  { body: "C++ is an alias of C#?", test_id: tests[6].id },
  { body: "Which collection does not allow duplicate members?", test_id: tests[7].id },
  { body: "Java is short for JavaScript?", test_id: tests[8].id },
  { body: "Which keyword is used to declare a function?", test_id: tests[9].id },
  { body: "Is Fortran interpreter type language?", test_id: tests[10].id },
  { body: "Which commands are used to display the content of the workspace?", test_id: tests[11].id }
])

answers = Answer.create!([
  { body: "Symbols", question_id: questions[0].id },
  { body: "Object Relational Mapper", question_id: questions[1].id },
  { body: "UTF-8", question_id: questions[2].id },
  { body: "Cascading Style Sheets", question_id: questions[3].id },
  { body: "Body", question_id: questions[4].id },
  { body: "No", question_id: questions[5].id },
  { body: "No", question_id: questions[6].id },
  { body: "Set", question_id: questions[7].id },
  { body: "No", question_id: questions[8].id },
  { body: "Fun", question_id: questions[9].id },
  { body: "Yes", question_id: questions[10].id },
  { body: "Who", question_id: questions[11].id }
])

tests_user = TestsUser.create!([
  { test_id: tests[0].id, user_id: users[0].id },
  { test_id: tests[1].id, user_id: users[0].id },
  { test_id: tests[2].id, user_id: users[1].id },
  { test_id: tests[3].id, user_id: users[1].id },
  { test_id: tests[4].id, user_id: users[1].id },
  { test_id: tests[5].id, user_id: users[3].id },
  { test_id: tests[6].id, user_id: users[2].id },
  { test_id: tests[7].id, user_id: users[2].id },
  { test_id: tests[8].id, user_id: users[4].id },
  { test_id: tests[9].id, user_id: users[4].id },
  { test_id: tests[10].id, user_id: users[3].id },
  { test_id: tests[11].id, user_id: users[3].id }
])
