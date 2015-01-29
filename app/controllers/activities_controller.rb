class ActivitiesController < ApplicationController

  def create
    @activity = Activity.create
    @program.activities << @activity
    @athlete.activities << @activity

  end

  def update
    @activity = Activity.find(params[:id])
    @activity.update_attributes(completed: true)
      redirect_to athlete_path(athlete)
  end

  private

    def activity_params
      params.require(:activity).permit(:completed, :completed_at, :feedback)
    end

end
