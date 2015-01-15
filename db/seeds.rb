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

Program.create(name: 'First Program')
Program.create(name: 'Second Program')

user = User.create! :email => 'john@example.com', :password => 'topsecret', :password_confirmation => 'topsecret'
