# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
5.times do |n|
  email = "trainer#{n+1}@mail.com"
  password = "password"
  password_confirmation = "password"
  User.create!(email: email, password: password, password_confirmation: password_confirmation)
end

@trainer_names = ["Mac", "Joe", "Mark", "Chris", "Thornton"]
@athlete_names = ["Margie", "Joey", "will", "Sarah", "Thomas", "Bobby", "Blake", "Carson", "George", "Clara", "Christina", "Greg", "Laura", "Max", "Dude", "Joon", "Paul", "Derek", "Conrad", "Craig", "Nick", "Amanda"]
@program_names = ["First", "Second", "Third", "Fourth"]

users = User.where(:role => 0)

users.each_with_index do |user, i|
  user.update_attributes(:role => 2)
  Trainer.create!(name: @trainer_names[i], organization: "N/A",
                 certifications: "Lots", user_id: user.id)
end

22.times do |n|
  email = "athlete#{n+1}@mail.com"
  password = "password"
  User.create!(email: email, password: password, password_confirmation: password)
end

users = User.where(:role => 0)

users.each_with_index do |user, i|
  user.update_attributes(:role => 1)
  Athlete.create!(name: @athlete_names[i], user_id: user.id)
end

Trainer.all.each_with_index do |trainer, i|
  4.times do |n|
    Program.create!(name: " #{@program_names[n+=1]} Program", trainer_id: trainer.id)
  end
end

Program.all.each do |program|
  4.times do |n|
    program.routines << (Routine.create(exercise: Exercise.all.sample, sets: 3, reps: 3))
  end
end