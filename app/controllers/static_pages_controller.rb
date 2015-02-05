class StaticPagesController < ApplicationController

  def home
    render layout: "home_page_layout"
    if (current_user && current_user.trainer?)
      @trainer = Trainer.find_by(user_id: current_user.id.to_i)
    end

    if (current_user && current_user.athlete?)
      @athlete = Athlete.find_by(user_id: current_user.id.to_i)
    end
  end

  def about
    if (current_user && current_user.trainer?)
      @trainer = Trainer.find_by(user_id: current_user.id.to_i)
    end

    if (current_user && current_user.athlete?)
      @athlete = Athlete.find_by(user_id: current_user.id.to_i)
    end
  end

  def role
  end
end
