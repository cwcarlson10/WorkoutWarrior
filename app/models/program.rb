class Program < ActiveRecord::Base
  validates :name, format: { with: /\A[ a-zA-Z0-9]+[a-zA-Z0-9]+\z/,
                             message: "only allows letters" }
  validates :name, length: { maximum: 100 }
  validates :name, presence: true
end
