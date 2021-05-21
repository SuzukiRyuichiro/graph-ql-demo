User.destroy_all

5.times do
  user = User.create(name: Faker::Name.name, email: Faker::Internet.email)
  p user
  5.times do
    p Post.create(title: Faker::Lorem.sentence(word_count:3), content: Faker::Lorem.paragraph(sentence_count:40), user: user)
  end
end
