class Trainer < ActiveRecord::Base
  belongs_to :user
  has_many :athletes
  has_many :programs, dependent: :destroy

  validates :user, presence: true, uniqueness: true
  validates :name, presence: true
  validates_with RoleValidator, :role => 'trainer'

  def my_athletes
    self.athletes
  end
end
