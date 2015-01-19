class Trainer < ActiveRecord::Base
  belongs_to :user
  has_many :programs, dependent: :destroy
end
