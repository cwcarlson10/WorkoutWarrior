class ExercisesController < ApplicationController



  def index
    @exercise = Exercise.new
    lower_body = ['Squats', 'Lunges', 'Calf Raises', 'Glute Kick-Back']
    upper_body = ['Pull-ups', 'Bench Press', 'Rows', 'Push-ups']
    core = ['Leg Lifts', 'Sit-Ups', 'Russian Twists', 'Plank']
    cardio = ['Running', 'Elyptical', 'Jump Rope', 'Stair Climber']
  end


end
