class RoleValidator < ActiveModel::Validator
  def validate(record)
    if User.find_by_id(record.user_id).try(:role) != options[:role]
      record.errors[:base] << "User role is not properly assigned."
    end
  end
end

class Athlete < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :programs
  belongs_to :trainer
  has_many :activities

  validates :user, presence: true, uniqueness: true
  validates :name, presence: true
  validates_with RoleValidator, :role => 'athlete'
end
