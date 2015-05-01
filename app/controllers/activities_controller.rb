class ActivitiesController < ApplicationController

  def create
    @activity = Activity.create(activity_params)
    @athlete = current_user.athlete
    @activity.save!
  	redirect_to athlete_path(@athlete)
  end

  private

	def activity_params
		params.require(:activity).permit(:completed_at, :feedback, :athlete_id, :program_id)
	end
end
