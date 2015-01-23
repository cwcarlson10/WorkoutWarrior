class ExercisesController < ApplicationController
  respond_to :html, :json
  before_action :authenticate_user!


  def index
    @exercises = Exercise.order('title asc').all
    	@lower_body = Exercise.where(category: 'Lower Body')
    	@upper_body = Exercise.where(category: 'Upper Body')
    	@core = Exercise.where(category: 'Core')
    	@cardio = Exercise.where(category: 'Cardio')
      respond_with @exercises
  end


end
