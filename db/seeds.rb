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

10.times do
  Advertisement.create!(
    title: RandomData.random_sentence,
    copy: RandomData.random_paragraph,
    price: RandomData.random_price
  )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"
