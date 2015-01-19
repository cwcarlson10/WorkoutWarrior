class StaticPagesController < ApplicationController

  def home
    if (current_user && current_user.trainer?)
      @trainer = Trainer.find_by(user_id: current_user.id.to_i)
    end
  end

  def about
  end

  def role
  end

end

