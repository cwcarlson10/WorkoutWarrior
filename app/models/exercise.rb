class Exercise < ActiveRecord::Base
  has_many :routines
  has_many :programs, through: :routines

  validates :title, presence: true
  #validates :description, presence: true

  @categories = ["Upper Body", "Lower Body", "Cardio", "Core"]

  def self.categories
    return @categories
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |exercise|
        csv << exercise.attributes.values_at(*column_names)
      end
    end
  end

end
