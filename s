[1mdiff --git a/app/assets/stylesheets/pages/_profilepage.scss b/app/assets/stylesheets/pages/_profilepage.scss[m
[1mindex 1b1c2df..accbda0 100644[m
[1m--- a/app/assets/stylesheets/pages/_profilepage.scss[m
[1m+++ b/app/assets/stylesheets/pages/_profilepage.scss[m
[36m@@ -15,6 +15,7 @@[m [mbody {[m
 [m
 .rounded-image {[m
   border-radius: 50%;[m
[32m+[m[32m  object-fit: cover;[m
 }[m
 [m
 .greeting {[m
[1mdiff --git a/app/models/user.rb b/app/models/user.rb[m
[1mindex 416487f..107bafb 100644[m
[1m--- a/app/models/user.rb[m
[1m+++ b/app/models/user.rb[m
[36m@@ -36,6 +36,6 @@[m [mclass User < ApplicationRecord[m
     return if photo.attached?[m
 [m
     # Attach the default photo (replace 'default_image.jpg' with your actual default image name)[m
[31m-    photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'SkillExchange.png')), filename: 'SkillExchange.png', content_type: 'image/png')[m
[32m+[m[32m    photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'user.png')), filename: 'user.png', content_type: 'image/png')[m
   end[m
 end[m
[1mdiff --git a/db/seeds.rb b/db/seeds.rb[m
[1mindex a67cb30..99e14a8 100644[m
[1m--- a/db/seeds.rb[m
[1m+++ b/db/seeds.rb[m
[36m@@ -31,7 +31,7 @@[m [mdaniel = User.create([m
   availibility: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short)[m
 )[m
 ary = ["https://xsgames.co/randomusers/avatar.php?g=male", "https://xsgames.co/randomusers/avatar.php?g=female"][m
[31m-  file = URI.open(ary.sample)[m
[32m+[m[32m  file = URI.open(ary[0])[m
   filename = "user#{SecureRandom.urlsafe_base64(5)}.jpg"[m
   daniel.photo.attach(io: file, filename: filename, content_type: "image/jpg")[m
 [m
[36m@@ -47,7 +47,7 @@[m [mbruno = User.create([m
   availibility: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short)[m
 )[m
 ary = ["https://xsgames.co/randomusers/avatar.php?g=male", "https://xsgames.co/randomusers/avatar.php?g=female"][m
[31m-  file = URI.open(ary.sample)[m
[32m+[m[32m  file = URI.open(ary[0])[m
   filename = "user#{SecureRandom.urlsafe_base64(5)}.jpg"[m
   bruno.photo.attach(io: file, filename: filename, content_type: "image/jpg")[m
 [m
[36m@@ -63,7 +63,7 @@[m [mmarcus = User.create([m
   availibility: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short)[m
 )[m
 ary = ["https://xsgames.co/randomusers/avatar.php?g=male", "https://xsgames.co/randomusers/avatar.php?g=female"][m
[31m-  file = URI.open(ary.sample)[m
[32m+[m[32m  file = URI.open(ary[0])[m
   filename = "user#{SecureRandom.urlsafe_base64(5)}.jpg"[m
   marcus.photo.attach(io: file, filename: filename, content_type: "image/jpg")[m
 [m
[36m@@ -79,7 +79,7 @@[m [mmichele = User.create([m
   availibility: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short)[m
 )[m
 ary = ["https://xsgames.co/randomusers/avatar.php?g=male", "https://xsgames.co/randomusers/avatar.php?g=female"][m
[31m-  file = URI.open(ary.sample)[m
[32m+[m[32m  file = URI.open(ary[1])[m
   filename = "user#{SecureRandom.urlsafe_base64(5)}.jpg"[m
   michele.photo.attach(io: file, filename: filename, content_type: "image/jpg")[m
 [m
[36m@@ -95,7 +95,7 @@[m [mleo = User.create([m
   availibility: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short)[m
 )[m
 ary = ["https://xsgames.co/randomusers/avatar.php?g=male", "https://xsgames.co/randomusers/avatar.php?g=female"][m
[31m-  file = URI.open(ary.sample)[m
[32m+[m[32m  file = URI.open(ary[0])[m
   filename = "user#{SecureRandom.urlsafe_base64(5)}.jpg"[m
   leo.photo.attach(io: file, filename: filename, content_type: "image/jpg")[m
 [m
[36m@@ -167,6 +167,8 @@[m [mend[m
 bruno.learn_skills << LearnSkill.create(user: bruno, skill: Skill.find_by(name: "Graphic Design"))[m
 bruno.teach_skills << TeachSkill.create(user: bruno, skill: Skill.find_by(name: "Coding in Python"))[m
 [m
[32m+[m[32mbruno.teach_skills.first.level = "Advanced"[m
[32m+[m[32mbruno.teach_skills.first.mode = "Online"[m
 [m
 leo.learn_skills << LearnSkill.create(user: leo, skill: Skill.find_by(name: "Problem Solving"))[m
 leo.teach_skills << TeachSkill.create(user: leo, skill: Skill.find_by(name: "Coding in Python"))[m
[36m@@ -219,7 +221,7 @@[m [mleo.save![m
 # end[m
 [m
 p 'Updating user bios...'[m
[31m-users.each do |user|[m
[32m+[m[32mUser.all do |user|[m
   # Get two random teach skills and two random learn skills for the bio[m
   teach_skill_1 = user.teach_skills.first[m
   teach_skill_2 = user.teach_skills.second[m
