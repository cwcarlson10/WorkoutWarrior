class Trainer < ActiveRecord::Base
  belongs_to :user
  has_many :athletes
  has_many :programs, dependent: :destroy

  def my_athletes
    self.athletes
  end
end
