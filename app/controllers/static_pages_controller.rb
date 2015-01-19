class StaticPagesController < ApplicationController

  def home
    @trainer = Trainer.find_by(user_id: current_user.id.to_i) if current_user.trainer?
  end

  def about
  end

  def role
  end

end

