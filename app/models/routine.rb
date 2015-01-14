class Routine < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :program
end
