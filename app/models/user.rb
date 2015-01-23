class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :trainer
  has_one :athlete
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauth_providers => [:facebook]

  validate :role, presence: true

  enum role: [:newuser, :athlete, :trainer]

  after_find :load_role

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth["info"]["email"]
      user.password = Devise.friendly_token[0,20]
      binding.pry
      # user.username = auth.info.nickname I might need this later
    end
  end

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
    !!self.athlete
  end

  def athlete
    @athlete ||= self.athlete!
  end

  def athlete!
    @athlete = Athlete.where(user_id: self.id).first
  end

  private

    def load_role
      self.trainer? || self.athlete?
    end

end
