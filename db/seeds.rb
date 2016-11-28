# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(name: "Zoe", email: "zathorne@gmail.com", password: "iloverails", password_confirmation: "iloverails")
user2 = User.create(name: "Colin", email: "colin@gmail.com", password: "password", password_confirmation: "password", tier: "foundation")

user1.user_words.create(word_id: 1)
user1.user_words.create(word_id: 2)
user1.user_words.create(word_id: 3, stage: 1)
user1.user_words.create(word_id: 4, stage: 4)

user2.user_words.create(word_id: 4, stage: 2)
user2.user_words.create(word_id: 5)
user2.user_words.create(word_id: 6)

training1 = user1.Training.create(name: "First training")
training2 = user1.Training.create(name: "Second training", topic: "local area")

training3 = user2.Training.create(name: "First training")

training1.training_words.create(word_id: 1)
training1.training_words.create(word_id: 2)
training2.training_words.create(word_id: 3)
training2.training_words.create(word_id: 4)

training3.training_words.create(word_id: 4)
training3.training_words.create(word_id: 5)
training3.training_words.create(word_id: 6)

word1 = Word.create(language: "german", english: "alone", tl: "allein", topic: "me, my family and friends", word_type: "adj", tier: "foundation")
word2 = Word.create(language: "german", english: "print", tl: "drucken", topic: "technology", word_type: "verb", tier: "foundation")
word3 = Word.create(language: "german", english: "adventure film", tl: "der Abenteuerfilm", topic: "free-time activities", word_type: "noun", tier: "foundation")
Word.create(language: "german", english: "advent wreath", tl: "der Adventzkranz", topic: "festivals", word_type: "adj", tier: "foundation")
Word.create(language: "german", english: "traffic light", tl: "die Ampel", topic: "local area", word_type: "noun", tier: "foundation")
Word.create(language: "german", english: "to be dependent on", tl: "abhängig sein von", topic: "social issues", word_type: "verb", tier: "foundation")
Word.create(language: "german", english: "rubbish", tl: "der Abfall", topic: "global issues", word_type: "noun", tier: "foundation")
Word.create(language: "german", english: "leave", tl: "abfahren", topic: "travel and tourism", word_type: "verb", tier: "foundation")
Word.create(language: "german", english: "headteacher", tl: "der Direktor", topic: "school", word_type: "noun", tier: "foundation")
Word.create(language: "german", english: "apprentice", tl: "der Azubi", topic: "education post-16", word_type: "noun", tier: "foundation")
Word.create(language: "german", english: "employee", tl: "der Angestellte", topic: "work", word_type: "noun", tier: "foundation")
Word.create(language: "german", english: "single parent", tl: "der Alleinerziehende", topic: "me, my family and friends", word_type: "noun", tier: "foundation")
Word.create(language: "german", english: "applications", tl: "die Anwendungen", topic: "technology", word_type: "noun", tier: "higher")
Word.create(language: "german", english: "April fool's trick", tl: "der Aprilscherz", topic: "festivals", word_type: "noun", tier: "higher")
Word.create(language: "german", english: "storeroom", tl: "der Abstellraum", topic: "local area", word_type: "noun", tier: "higher")
Word.create(language: "german", english: "teetotal", tl: "abstinent", topic: "social issues", word_type: "adj", tier: "higher")
Word.create(language: "german", english: "deforestation", tl: "die Abholzung", topic: "global issues", word_type: "noun", tier: "higher")
Word.create(language: "german", english: "souvenir", tl: "das Andenken", topic: "travel and tourism", word_type: "noun", tier: "higher")
Word.create(language: "german", english: "language assistant", tl: "der Fremdsprachenassistent", topic: "school", word_type: "adj", tier: "higher")
Word.create(language: "german", english: "employ", tl: "einstellen", topic: "education post-16", word_type: "verb", tier: "higher")
Word.create(language: "german", english: "employer", tl: "der Arbeitgeber", topic: "work", word_type: "noun", tier: "higher")
Word.create(language: "german", english: "similar", tl: "ähnlich", topic: "key words", word_type: "adj", tier: "foundation")
word4 = Word.create(language: "german", english: "as if", tl: "als ob", topic: "connectives", word_type: "other", tier: "foundation")
word5 = Word.create(language: "german", english: "through", tl: "durch", topic: "prepositions", word_type: "other", tier: "foundation")
word6 = Word.create(language: "german", english: "idea", tl: "die Ahnung", topic: "opinions", word_type: "noun", tier: "foundation")