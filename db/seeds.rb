# db/seeds.rb
require 'faker'

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
50.times do
  users << User.create(
    email: Faker::Internet.unique.email,
    password: 'password123',
    name: Faker::Name.name,
    age: Faker::Number.between(from: 18, to: 60),
    gender: Faker::Gender.binary_type,
    city: Faker::Address.city,
    bio: Faker::Lorem.paragraph,
    availibility: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short)
  )
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
25.times do
  teach_skill_1 = teach_skills.sample
  teach_skill_2 = teach_skills.sample
  learn_skill_1 = learn_skills.sample
  learn_skill_2 = learn_skills.sample

  matches << Match.create!(
    status: ['Pending', 'Accepted', 'Rejected'].sample,
    teach_skill_1: teach_skill_1,
    teach_skill_2: teach_skill_2,
    learn_skill_1: learn_skill_1,
    learn_skill_2: learn_skill_2
  )
end
