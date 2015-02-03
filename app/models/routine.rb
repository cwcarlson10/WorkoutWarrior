class Routine < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :program

  validates :exercise, presence: true
  validates :program, presence: true
end
