class Exercise < ActiveRecord::Base
  # attr_accessor: :categories
  #
  # def categories
  #   @categories = ['']
  # end
  has_many :routines
end
