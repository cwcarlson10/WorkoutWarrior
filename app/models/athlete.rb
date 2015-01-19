class Athlete < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :programs
  belongs_to :trainer
end
