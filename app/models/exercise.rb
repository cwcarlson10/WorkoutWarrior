class Exercise < ActiveRecord::Base
  # attr_accessor: :categories
  #
  # def categories
  #   @categories = ['']
  # end
  has_many :routines
  has_many :programs, through: :routines
end
