# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


lower_body = ['Squats', 'Lunges', 'Calf Raises', 'Glute Kick-Back']
upper_body = ['Pull-ups', 'Bench Press', 'Rows', 'Push-ups']
core = ['Leg Lifts', 'Sit-Ups', 'Russian Twists', 'Plank']
cardio = ['Running', 'Elyptical', 'Jump Rope', 'Stair Climber']

lower_body.each do |e|
  Exercise.find_or_create_by(title: e) do |exercise| 
  	exercise.category = 'Lower Body'
  end
end

upper_body.each do |e|
  Exercise.find_or_create_by(title: e) do |exercise| 
  	exercise.category = 'Upper Body'
  end
end

core.each do |e|
  Exercise.find_or_create_by(title: e) do |exercise| 
  	exercise.category = 'Core'
  end
end

cardio.each do |e|
  Exercise.find_or_create_by(title: e) do |exercise|
  	exercise.category = 'Cardio'
  end
end

User.create! :email => 'doug@example.com', :password => 'topsecret', :password_confirmation => 'topsecret'
User.create! :email => 'dave@example.com', :password => 'topsecret', :password_confirmation => 'topsecret'
User.create! :email => 'sam@example.com', :password => 'topsecret', :password_confirmation => 'topsecret'
User.create! :email => 'evan@example.com', :password => 'topsecret', :password_confirmation => 'topsecret'
User.create! :email => 'nicholas@example.com', :password => 'topsecret', :password_confirmation => 'topsecret'
User.create! :email => 'kevin@example.com', :password => 'topsecret', :password_confirmation => 'topsecret'
User.create! :email => 'chris@example.com', :password => 'topsecret', :password_confirmation => 'topsecret'
User.create! :email => 'sarah@example.com', :password => 'topsecret', :password_confirmation => 'topsecret'
User.create! :email => 'alice@example.com', :password => 'topsecret', :password_confirmation => 'topsecret'
User.create! :email => 'peter@example.com', :password => 'topsecret', :password_confirmation => 'topsecret'

users = User.all

(0..4).each do |id|
  users[id].update_attribute(:role, 1)
  Trainer.create(user_id: users[id].id)
end

(5..9).each do |id|
  users[id].update_attribute(:role, 0)
  Athlete.create(user_id: users[id].id)
end

@program1 = Program.new(name: 'First Program')
@program2 = Program.new(name: 'Second Program')
@program1.trainer_id = Trainer.first.user_id
@program2.trainer_id = Trainer.first.user_id
@routine1 = Routine.create(exercise: Exercise.find(1), sets: 3, reps: 3)
@routine2 = Routine.create(exercise: Exercise.find(2), sets: 3, reps: 3)
@routine3 = Routine.create(exercise: Exercise.find(3), sets: 3, reps: 3)
@routine4 = Routine.create(exercise: Exercise.find(4), sets: 3, reps: 3)
@routine5 = Routine.create(exercise: Exercise.find(5), sets: 3, reps: 3)
@routine6 = Routine.create(exercise: Exercise.find(6), sets: 3, reps: 3)
@routine7 = Routine.create(exercise: Exercise.find(7), sets: 3, reps: 3)
@routine8 = Routine.create(exercise: Exercise.find(8), sets: 3, reps: 3)
@program1.routines.push @routine1
@program1.routines.push @routine2
@program1.routines.push @routine3
@program1.routines.push @routine4
@program2.routines.push @routine5
@program2.routines.push @routine6
@program2.routines.push @routine7
@program2.routines.push @routine8
@program1.save
@program2.save
