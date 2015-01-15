class Exercise < ActiveRecord::Base
  has_many :routines

  # attr_accessor: :categories
  #
  # def categories
  #   @categories = ['']
  # end
  has_many :routines
  has_many :programs, through: :routines
end
