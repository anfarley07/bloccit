require 'random_data'

Post.find_or_create_by(title: "Bohemian Rhapsody", body: "Scaramouche, scaramouche can you do the fandango? Thunderbolts and ligtning, very, very frighning.")

# Creates seed Posts
50.times do
    Post.create!(
      title: RandomData.random_sentence,
      body: RandomData.random_paragraph
    )
end

posts = Post.all

# Creates seed Comments

Comment.find_or_create_by(post_id: 51, body: "I'm just a poor boy, nobyd loves me. He's just a poor boy from a poor family.")

100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

questions = Question.all

10.times do
  Question.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    resolved: RandomData.random_boolean
  )
end

20.times do
  Answer.create!(
    question: questions.sample,
    body: RandomData.random_paragraph
  )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Question.count} questions created"
puts "#{Answer.count} answers created"
