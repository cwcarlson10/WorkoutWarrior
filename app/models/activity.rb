class Activity < ActiveRecord::Base
  belongs_to :program
  belongs_to :athlete

  validates :athlete_id, presence: true
  validates :program_id, presence: true
end
