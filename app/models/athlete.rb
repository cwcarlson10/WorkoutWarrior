class Athlete < ActiveRecord::Base
  belongs_to :user
  has_many :programs
end
