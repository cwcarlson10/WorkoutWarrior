class Athlete < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_and_belongs_to_many :programs
  belongs_to :trainer
end
