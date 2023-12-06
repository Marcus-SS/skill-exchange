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
skills_list = ["Basketball", "Coding in Python", "Public Speaking", "Digital Marketing", "Time Management", "Mathematics", "Graphic Design", "Creative Writing", "Customer Service", "Problem Solving", "Data Analysis", "Photography", "Critical Thinking", "Football (Soccer)", "Project Management", "Financial Literacy", "Negotiation", "Foreign Language Proficiency", "Web Development", "Content Creation", "Leadership", "Chess", "Networking", "Public Relations", "SEO Optimization", "Videography", "Research", "C++, Java Programming", "Entrepreneurship", "Event Planning", "Conflict Resolution", "Drawing", "Yoga", "UX/UI Design", "Database Management", "Mobile App Development", "Customer Relationship Management (CRM)", "Business Analysis", "Sales Skills", "Teamwork", "Fitness Training", "Robotics", "Artificial Intelligence", "Email Marketing", "Physics", "Blogging", "Social Media Management", "Guitar Playing", "Emotional Intelligence", "Chemistry", "Editing (Video/Photo)", "Business Development", "Economics", "Cybersecurity", "Basket Weaving", "Creative Problem Solving", "3D Printing", "Public Health Knowledge", "Spanish Language Proficiency", "Virtual Reality (VR) Development", "SEO Copywriting", "Cryptocurrency Trading", "Creative Cooking", "Foreign Policy Analysis", "Meditation", "Desktop Publishing", "Project Planning", "Psychology", "UI/UX Design", "Music Production", "Search Engine Marketing (SEM)", "Conflict Management", "Geographic Information Systems (GIS)", "Graphic Illustration", "Digital Illustration", "Networking Security", "Investment Strategies", "Piano Playing", "Artificial Neural Networks", "Creative Strategy", "Fashion Design", "Strategic Planning", "Risk Management", "Environmental Science", "Mobile Photography", "Interior Design", "Human Resources Management", "Statistical Analysis", "Film Editing", "Computer-Aided Design (CAD)", "Digital Painting", "Machine Learning", "Blockchain Technology", "Product Design", "Culinary Arts", "Cryptography", "Machine Vision", "Cultural Competence", "Augmented Reality (AR) Development", "Statistical Modeling", "Project Leadership", "Video Game Development", "Astrophysics", "Financial Modeling", "Information Security", "Sociology", "Political Science", "Climate Change Adaptation", "Network Administration", "Philosophy", "Behavioral Economics", "Public Policy Analysis", "Creative Marketing", "Game Theory"]
skills = []
skills_list.each do |skill|
  skills << Skill.create!(name: skill)
end

# Seed users
users = []
p 'Creating users...'
daniel = User.create(
  email: 'daniel@gmail.com',
  password: 'password123',
  name: "Daniel",
  age: Faker::Number.between(from: 18, to: 60),
  gender: Faker::Gender.binary_type,
  city: Faker::Address.city,
  bio: Faker::Lorem.paragraph,
  availibility: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short)
)
ary = ["https://xsgames.co/randomusers/avatar.php?g=male", "https://xsgames.co/randomusers/avatar.php?g=female"]
  file = URI.open(ary[0])
  filename = "user#{SecureRandom.urlsafe_base64(5)}.jpg"
  daniel.photo.attach(io: file, filename: filename, content_type: "image/jpg")


bruno = User.create(
  email: 'bruno@gmail.com',
  password: 'password123',
  name: "Bruno",
  age: Faker::Number.between(from: 18, to: 60),
  gender: "Male",
  city: Faker::Address.city,
  bio: Faker::Lorem.paragraph,
  availibility: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short)
)
ary = ["https://xsgames.co/randomusers/avatar.php?g=male", "https://xsgames.co/randomusers/avatar.php?g=female"]
  file = URI.open(ary[0])
  filename = "user#{SecureRandom.urlsafe_base64(5)}.jpg"
  bruno.photo.attach(io: file, filename: filename, content_type: "image/jpg")


marcus = User.create(
  email: 'marcus@gmail.com',
  password: '123123',
  name: "Marcus",
  age: Faker::Number.between(from: 18, to: 60),
  gender: "Male",
  city: Faker::Address.city,
  bio: Faker::Lorem.paragraph,
  availibility: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short)
)
ary = ["https://xsgames.co/randomusers/avatar.php?g=male", "https://xsgames.co/randomusers/avatar.php?g=female"]
  file = URI.open(ary[0])
  filename = "user#{SecureRandom.urlsafe_base64(5)}.jpg"
  marcus.photo.attach(io: file, filename: filename, content_type: "image/jpg")


michele = User.create(
  email: 'michele@gmail.com',
  password: 'password123',
  name: "Michele",
  age: Faker::Number.between(from: 18, to: 60),
  gender: "Male",
  city: Faker::Address.city,
  bio: Faker::Lorem.paragraph,
  availibility: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short)
)
ary = ["https://xsgames.co/randomusers/avatar.php?g=male", "https://xsgames.co/randomusers/avatar.php?g=female"]
  file = URI.open(ary[1])
  filename = "user#{SecureRandom.urlsafe_base64(5)}.jpg"
  michele.photo.attach(io: file, filename: filename, content_type: "image/jpg")


leo = User.create(
  email: 'leo@gmail.com',
  password: 'password123',
  name: "leo",
  age: Faker::Number.between(from: 18, to: 60),
  gender: "Male",
  city: Faker::Address.city,
  bio: Faker::Lorem.paragraph,
  availibility: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short)
)
ary = ["https://xsgames.co/randomusers/avatar.php?g=male", "https://xsgames.co/randomusers/avatar.php?g=female"]
  file = URI.open(ary[0])
  filename = "user#{SecureRandom.urlsafe_base64(5)}.jpg"
  leo.photo.attach(io: file, filename: filename, content_type: "image/jpg")











  kevin = User.create(
    email: 'leo@gmail.com',
    password: 'password123',
    name: "leo",
    age: Faker::Number.between(from: 18, to: 60),
    gender: "Male",
    city: Faker::Address.city,
    bio: Faker::Lorem.paragraph,
    availibility: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short)
  )
  ary = ["https://xsgames.co/randomusers/avatar.php?g=male", "https://xsgames.co/randomusers/avatar.php?g=female"]
    file = URI.open(ary[0])
    filename = "user#{SecureRandom.urlsafe_base64(5)}.jpg"
    leo.photo.attach(io: file, filename: filename, content_type: "image/jpg")

# 3.times do
#   user = User.new(
#     email: Faker::Internet.unique.email,
#     password: 'password123',
#     name: Faker::Name.name,
#     age: Faker::Number.between(from: 18, to: 60),
#     gender: "Male",
#     city: Faker::Address.city,
#     bio: Faker::Lorem.paragraph,
#     availibility: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short)
#   )
#   ary = ["https://xsgames.co/randomusers/avatar.php?g=male", "https://xsgames.co/randomusers/avatar.php?g=female"]
#   file = URI.open(ary.sample)
#   filename = "user#{SecureRandom.urlsafe_base64(5)}.jpg"
#   user.photo.attach(io: file, filename: filename, content_type: "image/jpg")
#   user.save!
#   users << user
# end

p 'Creating teach_skills...'
# # Seed teach_skills
# teach_skills = []
# users.each do |user|
#   skills.sample(5).each do |skill|
#     teach_skills << TeachSkill.create(
#       mode: ['Online', 'In-person'].sample,
#       level: ['Beginner', 'Intermediate', 'Advanced'].sample,
#       user: user,
#       skill: skill
#     )

#   end

# end

# p 'Creating learn_skills...'
# # Seed learn_skills
# learn_skills = []
# users.each do |user|
#   skills.sample(5).each do |skill|
#     learn_skills << LearnSkill.create(user, skill)
#   end
# end

p 'Creating matches...'

ls_list = [
  ["Coding in Python", "Time Management", "Basketball", "Public Speaking", "Digital Marketing"],
  # Add more lists if needed
]

ts_list = [
  ["Graphic Design", "Creative Writing", "Customer Service", "Problem Solving", "Data Analysis"],
  # Add more lists if needed
]

# Set specific teach skills for the user
ts_list.each do |ts|
  marcus.teach_skills = ts.map { |skill_name| TeachSkill.create(user: marcus, skill: Skill.find_by(name: skill_name)) }
end

ls_list.each do |ls|
  marcus.learn_skills = ls.map { |skill_name| LearnSkill.create(user: marcus, skill: Skill.find_by(name: skill_name)) }
end

bruno.learn_skills << LearnSkill.create(user: bruno, skill: Skill.find_by(name: "Graphic Design"))
bruno.teach_skills << TeachSkill.create(user: bruno, skill: Skill.find_by(name: "Coding in Python"), level: "Advanced", mode: "Online")



leo.learn_skills << LearnSkill.create(user: leo, skill: Skill.find_by(name: "Problem Solving"))
leo.teach_skills << TeachSkill.create(user: leo, skill: Skill.find_by(name: "Coding in Python"), level: "Intermediate", mode: "Online")



daniel.learn_skills << LearnSkill.create(user: daniel, skill: Skill.find_by(name: "Creative Writing"))
daniel.teach_skills << TeachSkill.create(user: daniel, skill: Skill.find_by(name: "Time Management"), level: "Advanced", mode: "Online")


michele.learn_skills << LearnSkill.create(user: michele, skill: Skill.find_by(name: "Customer Service"))
michele.teach_skills << TeachSkill.create(user: michele, skill: Skill.find_by(name: "Basketball"), level: "Advanced", mode: "Online")



bruno.availibility = "Wednesdays from 6:00 to 10:00"
marcus.availibility = "Weekends from 6:00 to 10:00"
daniel.availibility = "Thurdays from 7:00 to 9:00"
leo.availibility = "Wednesdays from 6:00 to 10:00"
michele.availibility = "Monday-Wednesday from 5:00 to 7:00"


marcus.save!
bruno.save!
daniel.save!
michele.save!
leo.save!










ary = ["https://xsgames.co/randomusers/avatar.php?g=male", "https://xsgames.co/randomusers/avatar.php?g=female"]

# Lists of teach and learn skills
ls_list = ["Coding in Python", "Time Management", "Basketball", "Public Speaking", "Digital Marketing"]
  # Add more lists if needed

ts_list = ["Graphic Design", "Creative Writing", "Customer Service", "Problem Solving", "Data Analysis"]
  # Add more lists if needed


ls_list.each_with_index do |ls, index|
  skill = Skill.find_by(name: ls)

  6.times do
    user = User.create(
      email: SecureRandom.hex + '@example.com',
      password: 'password123',
      name: Faker::Name.unique.first_name,
      age: Faker::Number.between(from: 18, to: 60),
      gender: Faker::Gender.binary_type,
      city: Faker::Address.city,
      bio: Faker::Lorem.paragraph,
      availibility: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short)
    )

    gender_avatar = user.gender.downcase == "male" ? ary[0] : ary[1]
    file = URI.open(gender_avatar)
    filename = "user#{SecureRandom.urlsafe_base64(5)}.jpg"
    user.photo.attach(io: file, filename: filename, content_type: "image/jpg")

    # Set teach skill
    TeachSkill.create!(skill: skill, user: user, level: "Intermediate", mode: "Online")
    # Set learn skills
    learn_skill = Skill.find_by(name: ts_list.sample)
    LearnSkill.create!(user: user, skill: learn_skill)

    # Customize specific details
    user.availibility = "Wednesdays from 6:00 to 10:00"
    user.save!
  end
end





# 5.times do |i|
#   # Assuming each iteration corresponds to a different user
#   user = User.new(
#     email: Faker::Internet.unique.email,
#     password: 'password123',
#     name: Faker::Name.name,
#     age: Faker::Number.between(from: 18, to: 60),
#     gender: "Male",
#     city: Faker::Address.city,
#     bio: Faker::Lorem.paragraph,
#     availibility: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short)
#   )

#   ary = ["https://xsgames.co/randomusers/avatar.php?g=male", "https://xsgames.co/randomusers/avatar.php?g=female"]
#   file = URI.open(ary.sample)
#   filename = "user#{SecureRandom.urlsafe_base64(5)}.jpg"
#   user.photo.attach(io: file, filename: filename, content_type: "image/jpg")

#   # Get the skills for this iteration
#   ls = ls_list[i % ls_list.length]
#   ts = ts_list[i % ts_list.length]

#   # Set specific teach skills for the user
#   user.teach_skills = ls.map { |skill_name| TeachSkill.create(user: user, skill_id: Skill.find_by(name: skill_name).id) }

#   # Set specific learn skills for the user
#   user.learn_skills = ts.map { |skill_name| LearnSkill.create(user: user, skill_id: Skill.find_by(name: skill_name).id) }

#   user.save!
#   users << user
# end

p 'Updating user bios...'
User.all do |user|
  # Get two random teach skills and two random learn skills for the bio
  teach_skill_1 = user.teach_skills.first
  teach_skill_2 = user.teach_skills.second
  learn_skill_1 = user.learn_skills.first
  learn_skill_2 = user.learn_skills.second

  # Update the user's bio
  user.bio = "Hi! I'm #{user.name}, a #{teach_skill_1.skill.name} expert based in #{user.city}. " \
              "I'm looking to learn more about #{learn_skill_1.skill.name} and #{learn_skill_2.skill.name}. " \
              "I'm also happy to teach you about #{teach_skill_2.skill.name}!"
  user.save!
end


# # seeding matches
# matches = []
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
