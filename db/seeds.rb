require 'random_data'

Post.find_or_create_by(title: "Bohemian Rhapsody", body: "Scaramouche, scaramouche can you do the fandango? Thunderbolts and ligtning, very, very frighning.")

#create topics
15.times do
  Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end
topics = Topic.all

# Creates seed Posts
50.times do
    Post.create!(
      topic: topics.sample,
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

#create advertisements
10.times do
  SponsoredPost.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    price: RandomData.random_price
  )
end

puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{SponsoredPost.count} advertisements created"
