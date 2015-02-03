class Routine < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :program

  validates :exercise, presence: true
  # Removing this validation because the routines
  # can't receive a program_id until the program is
  # saved which required valid routines
  # validates :program, presence: true
end
