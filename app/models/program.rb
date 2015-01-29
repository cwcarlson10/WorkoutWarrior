class Program < ActiveRecord::Base
  belongs_to :trainer
  has_and_belongs_to_many :athletes
  has_many :routines
  has_many :exercises, through: :routines
  has_many :activities

  accepts_nested_attributes_for :routines, :reject_if => :all_blank, :allow_destroy => true

  validates :name, format: { with: /\A[ a-zA-Z0-9]+[a-zA-Z0-9]+\z/,
                             message: "only allows letters" }
  validates :name, length: { maximum: 100 }
  validates :name, presence: true
  validates :trainer_id, presence: true
end
