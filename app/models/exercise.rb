class Exercise < ActiveRecord::Base
  has_many :routines
  has_many :programs, through: :routines

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true

  @categories = ["Upper Body", "Lower Body", "Cardio", "Core"]

  def self.categories
    return @categories
  end

end
