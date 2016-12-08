# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'vocab_list.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  w = Word.new
  w.language = row['language']
  w.tl = row['tl']
  w.english = row['english']
  w.word_type = row['word_type']
  w.topic = row['topic']
  w.tier = row['tier']
  w.save
  puts "#{w.tl}, #{w.english} saved"
end

puts "There are now #{Word.count} rows in the words table"

user1 = User.create(name: "Zoe", email: "zathorne@gmail.com", password: "iloverails", password_confirmation: "iloverails")
user2 = User.create(name: "Colin", email: "colin@gmail.com", password: "password", password_confirmation: "password", tier: "foundation")

user1.user_words.create(word_id: 1)
user1.user_words.create(word_id: 2)
user1.user_words.create(word_id: 3, stage: 1)
user1.user_words.create(word_id: 4, stage: 4)

user2.user_words.create(word_id: 4, stage: 2)
user2.user_words.create(word_id: 5)
user2.user_words.create(word_id: 6)

training1 = user1.trainings.create(name: "First training", stage: "all stages", word_type: "all word types")
training2 = user1.trainings.create(name: "Second training", stage: "all stages", word_type: "all word types")

training3 = user2.trainings.create(name: "First training", stage: "all stages", word_type: "all word types")

training1.training_words.create(word_id: 1)
training1.training_words.create(word_id: 2)
training2.training_words.create(word_id: 3)
training2.training_words.create(word_id: 4)

training3.training_words.create(word_id: 4)
training3.training_words.create(word_id: 5)
training3.training_words.create(word_id: 6)

ach1 = Achievement.create(name: "1000words", icon: "1000words.png", description: "Learned 1000 words")
ach2 = Achievement.create(name: "100words", icon: "100words.png", description: "Learned 100 word")
ach3 = Achievement.create(name: "10words", icon: "10words.png", description: "Learned 10 words")
ach4 = Achievement.create(name: "1500words", icon: "1500words.png", description: "Learned 1500 words")
ach5 = Achievement.create(name: "1month", icon: "1month.png", description: "Trained for a month straight")
ach6 = Achievement.create(name: "1ofeach", icon: "1ofeach.png", description: "Learned a word from every topic")
ach7 = Achievement.create(name: "1st", icon: "1st.png", description: "Learned first word")
ach8 = Achievement.create(name: "250words", icon: "250words.png", description: "Learned 250 words")
ach9 = Achievement.create(name: "25words", icon:"25words.png", description: "Learned 25 words")
ach10 = Achievement.create(name: "2days", icon: "2days.png", description:"Trained for 2 days in a row")
ach11 = Achievement.create(name: "2weeks", icon: "2weeks.png", description:"Trained for 2 weeks in a row")
ach12 = Achievement.create(name: "3days", icon: "3days.png", description:"Trained for 3 days in a row")
ach13 = Achievement.create(name: "3weeks", icon: "3weeks.png", description: "Trained for 3 weeks in a row")
ach14 = Achievement.create(name: "500words", icon: "500words.png", description: "Learned 500 words")
ach15 = Achievement.create(name: "50words", icon: "50words.png", description: "Learned 50 words")
ach16 = Achievement.create(name: "5days", icon: "5days.png", description: "Trained for 5 days in a row")
ach17 = Achievement.create(name: "7days", icon: "7days.png", description: "Trained for 7 days in a row")
ach18 = Achievement.create(name: "allfoundation", icon: "allfoundation.png", description: "Learned all foundation words")
ach19 = Achievement.create(name: "allwords", icon: "allwords.png", description: "Learned all foundation and higher words")
ach20 = Achievement.create(name: "completetopic", icon: "completetopic.png", description: "Completed first topic")
ach21 = Achievement.create(name: "connectives", icon: "connectives.png", description: "Completed Connectives topic")
ach22 = Achievement.create(name: "education", icon: "education.png", description: "Completed Education topic")
ach23 = Achievement.create(name: "festivals", icon: "festivals.png", description: "Completed Festivals topic")
ach24 = Achievement.create(name: "global", icon: "global.png", description: "Completed Global Issues topic")
ach25 = Achievement.create(name: "health", icon: "health.png", description: "Completed Health & Social Issues topic")
ach26 = Achievement.create(name: "home", icon: "home.png", description: "Completed Home & Local Area topic")
ach27 = Achievement.create(name: "improve", icon: "improve.png", description: "Improved score of a training session")
ach28 = Achievement.create(name: "keywords", icon: "keywords.png", description: "Completed Key Words topic")
ach29 = Achievement.create(name: "leisure", icon: "leisure.png", description: "Completed Leisure topic")
ach30 = Achievement.create(name: "me", icon: "me.png", description: "Completed Me, My Family & Friends topic")
ach31 = Achievement.create(name: "opinions", icon: "opinions.png", description: "Completed Opinions topic")
ach32 = Achievement.create(name: "prepositions", icon: "prepositions.png", description: "Completed Prepositions topic")
ach33 = Achievement.create(name: "stage2", icon: "stage2.png", description: "Reached Stage 2 of a word")
ach34 = Achievement.create(name: "stage5", icon: "stage5.png", description: "Reached Stage 5 of a word")
ach35 = Achievement.create(name: "technology", icon: "technology.png", description: "Completed Technology topic")
ach36 = Achievement.create(name: "travel", icon: "travel.png", description: "Completed Travel & Tourism topic")
ach37 = Achievement.create(name: "work", icon: "work.png", description: "Completed Work topic")