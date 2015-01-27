class ExercisesController < ApplicationController

  def index
    @exercises = Exercise.all
    	@lower_body = Exercise.where(category: 'Lower Body')
    	@upper_body = Exercise.where(category: 'Upper Body')
    	@core = Exercise.where(category: 'Core')
    	@cardio = Exercise.where(category: 'Cardio')
  end

  private

  def get_exercises
    page = 1
    result = ''
      while page <= 8
        result_hash = HTTParty.get("https://wger.de/api/v2/exercise/?page=#{page}&language=2")
        result_hash['next']
        result_hash['results'].each do |result|
          Exercise.create!(title: result['name'], description: result['description'])
        end
        page += 1
      end
  end

end
