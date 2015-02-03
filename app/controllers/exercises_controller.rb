class ExercisesController < ApplicationController

  def index
    @exercises = Exercise.all.order[:category]
    	@lower_body = Exercise.where(category: 'Lower Body')
    	@upper_body = Exercise.where(category: 'Upper Body')
    	@core = Exercise.where(category: 'Core')
    	@cardio = Exercise.where(category: 'Cardio')
  end
