class Trainer < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :athletes
  has_many :programs, dependent: :destroy
end
