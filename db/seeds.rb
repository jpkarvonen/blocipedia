require 'faker'

10.times do
   User.create!(
   email:    Faker::Internet.email,
   password: Faker::Crypto.md5
   )
end
 
users = User.all

75.times do
    wiki = Wiki.create!(
        user:   users.sample,
        title:  Faker::Dune.quote,
        body:   Faker::Dune.saying
    )
    
    wiki.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)

end


puts "Seeds finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"

