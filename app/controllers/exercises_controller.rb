class ExercisesController < ApplicationController
  before_action :authenticate_user!


  def index
    @exercises = Exercise.all
    	@lower_body = Exercise.where(category: 'Lower Body')
    	@upper_body = Exercise.where(category: 'Upper Body')
    	@core = Exercise.where(category: 'Core')
    	@cardio = Exercise.where(category: 'Cardio')
  end


end
