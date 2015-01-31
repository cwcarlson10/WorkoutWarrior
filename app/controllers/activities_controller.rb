class ActivitiesController < ApplicationController

  def create
    @athlete = Athlete.find(params[:athlete_id])
    @program = Program.find(params[:program_id])
    @activity = Activity.new(:athlete_id => @athlete.id, :program_id => @program.id)
    @activity.save!
      redirect_to athlete_path(@athlete)
  end

  def update
    @athlete = Athlete.find(params[:athlete_id])
    @program = Program.find(params[:program_id])
    @activity = Activity.find(params[:id])
    @activity.update_attributes(activity_params[completed: true, :completed_at => Time.now, :feedback])
    @activity.save
      redirect_to athlete_path(@athlete)
  end

  def edit
    @activity.update_attributes(:completed, :completed_at, :feedback)
      redirect_to
  end

  private

 def activity_params
    params.require(:activity).permit(:completed, :completed_at, :feedback)
  end
end
