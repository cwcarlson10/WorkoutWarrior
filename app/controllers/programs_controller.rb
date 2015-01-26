class ProgramsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_trainer
  before_action :set_program, only: [:show, :edit, :update, :destroy]

  def index
    @programs = Program.where(trainer_id: @trainer.id)
  end

  def show
    @athletes = @program.athletes
  end

  def new
    @program = Program.new
  end

  def create
    @program = @trainer.programs.build(program_params)
    @program.athletes = Athlete.where(id: athlete_ids)
    if @program.save
      redirect_to programs_path
    else
      render :new
    end
  end

  def update
    if @program.update_attributes(program_params)
      # Remove empty string elements and iterate
      (params[:athlete_ids] - [""]).each do |athlete_id|
        @program.athletes << Athlete.find(athlete_id)
      end

      redirect_to program_path
    else
      render :edit
    end
  end

  def destroy
    @program.destroy
    redirect_to programs_url
  end

  def program_athletes
    @athletes = @trainer.athletes
    @program = Program.find(params[:id])
  end

  def add_athlete_to_program
    @program = Program.find(params[:id])
    athlete = Athlete.find(params[:athlete_id])
    @program.athletes <<  athlete
        # binding.pry
    @program.save
      redirect_to program_path
  end

  def remove_athlete_from_program
    @program.athletes.find(params[:id])
    redirect_to program_path
  end

  private
    def set_program
      @program = Program.find(params[:id])
    end

    def set_trainer
      @trainer = current_user.trainer
   end

    def program_params
      params.require(:program).permit(:name, :trainer_id, routines_attributes: [:id, :sets, :reps, :duration, :instructions, :exercise_id, :_destroy ])
    end
end
