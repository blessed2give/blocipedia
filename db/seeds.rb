
50.times do

  User.create! (
    email: Faker::Internet.email,
    password: Faker::Lorem.word
  )
end
users = User.all

50.times do

  Wiki.create! (
    user: users.sample,
    title: Faker::Space.star,
    body: Faker::Lorem.paragraphs,
    private: Faker::Boolean.boolean
  )
end
wikis = Wiki.all

puts "Seed finished"
puts "#{users.count} users created"
puts "#{wikis.count} wikis created"
