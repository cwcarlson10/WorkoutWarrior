class Program < ActiveRecord::Base
  belongs_to :user
  has_many :routines
  has_many :exercises, through: :routines

  validates :name, format: { with: /\A[ a-zA-Z0-9]+[a-zA-Z0-9]+\z/,
                             message: "only allows letters" }
  validates :name, length: { maximum: 100 }
  validates :name, presence: true
  validates :user_id, presence: true
end
