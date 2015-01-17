class Exercise < ActiveRecord::Base
  has_many :routines
  has_many :programs, through: :routines

  @categories = ["Upper Body", "Lower Body", "Cardio", "Core"]

  def self.exercise_categories
    return @categories
  end

end
