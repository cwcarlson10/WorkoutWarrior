class Exercise < ActiveRecord::Base
  has_many :routines

  # attr_accessor: :categories
  #
  # def categories
  #   @categories = ['']
  # end
end
