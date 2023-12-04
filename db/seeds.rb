# db/seeds.rb
require 'faker'

Message.destroy_all
Chatroom.destroy_all
Match.destroy_all
TeachSkill.destroy_all
LearnSkill.destroy_all
Skill.destroy_all
User.destroy_all

p 'Creating skills...'
# Seed skills
skills = []
100.times { skills << Skill.create(name: Faker::Job.title + SecureRandom.hex(2)) }

# Seed users
users = []
p 'Creating users...'
users << User.create(
  email: 'daniel@gmail.com',
  password: 'password123',
  name: "Daniel",
  age: Faker::Number.between(from: 18, to: 60),
  gender: Faker::Gender.binary_type,
  city: Faker::Address.city,
  bio: Faker::Lorem.paragraph,
  availibility: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short)
)
users << User.create(
  email: 'bruno@gmail.com',
  password: 'password123',
  name: "Bruno",
  age: Faker::Number.between(from: 18, to: 60),
  gender: "Male",
  city: Faker::Address.city,
  bio: Faker::Lorem.paragraph,
  availibility: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short)
)
users << User.create(
  email: 'marcus@gmail.com',
  password: 'password123',
  name: "Marcus",
  age: Faker::Number.between(from: 18, to: 60),
  gender: "Male",
  city: Faker::Address.city,
  bio: Faker::Lorem.paragraph,
  availibility: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short)
)
47.times do
  user = User.new(
    email: Faker::Internet.unique.email,
    password: 'password123',
    name: Faker::Name.name,
    age: Faker::Number.between(from: 18, to: 60),
    gender: "Male",
    city: Faker::Address.city,
    bio: Faker::Lorem.paragraph,
    availibility: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short)
  )
  ary = ["https://xsgames.co/randomusers/avatar.php?g=male", "https://xsgames.co/randomusers/avatar.php?g=female"]
  file = URI.open(ary.sample)
  filename = "user#{SecureRandom.urlsafe_base64(5)}.jpg"
  user.photo.attach(io: file, filename: filename, content_type: "image/jpg")
  user.save!
  users << user
end

p 'Creating teach_skills...'
# Seed teach_skills
teach_skills = []
users.each do |user|
  skills.sample(3).each do |skill|
    teach_skills << TeachSkill.create(
      mode: ['Online', 'In-person'].sample,
      level: ['Beginner', 'Intermediate', 'Advanced'].sample,
      user_id: user.id,
      skill_id: skill.id
    )
  end
end

p 'Creating learn_skills...'
# Seed learn_skills
learn_skills = []
users.each do |user|
  skills.sample(2).each do |skill|
    learn_skills << LearnSkill.create(user_id: user.id, skill_id: skill.id)
  end
end

p 'Creating matches...'
# Seed matches
matches = []
# 25.times do
#   teach_skill_1 = teach_skills.sample
#   teach_skill_2 = teach_skills.sample
#   learn_skill_1 = learn_skills.sample
#   learn_skill_2 = learn_skills.sample

#   matches << Match.create!(
#     status: ['Pending', 'Accepted', 'Rejected'].sample,
#     teach_skill_1: teach_skill_1,
#     teach_skill_2: teach_skill_2,
#     learn_skill_1: learn_skill_1,
#     learn_skill_2: learn_skill_2
#   )
# end

p 'Creating chatroom...'

# Chatroom.create!(match: Match.find_by_status("Accepted"))
