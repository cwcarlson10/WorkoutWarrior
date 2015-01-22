class Athlete < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_and_belongs_to_many :programs
  belongs_to :trainer

  validates :user_id, presence: true
  validates :name, presence: true
  validates_associated :users
end
