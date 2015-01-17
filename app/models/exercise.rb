class Exercise < ActiveRecord::Base
  has_many :routines
  has_many :programs, through: :routines

  @categories = ["Upper Body", "Lower Body", "Cardio", "Core"]

  def self.categories
    return @categories
  end

end
