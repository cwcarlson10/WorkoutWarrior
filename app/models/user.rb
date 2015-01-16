class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :programs, dependent: :destroy

  validate :role, presence: true

  enum role: [:athlete, :trainer]
  def trainer?
    !!self.trainer
  end

  def trainer
    @trainer ||= self.trainer!
  end

  def trainer!
    @trainer = Trainer.where(user_id: self.id).first
  end

  def athlete?
    false
  end

end
