class ProgramsController < ApplicationController
  respond_to :html, :json, :js
  before_action :authenticate_user!
  before_action :set_trainer
  before_action :set_program_athletes, only: [:show, :add_athlete_to_program, :remove_athlete_from_program]
  before_action :set_program, only: [:show, :edit, :update, :destroy, :add_athlete_to_program, :remove_athlete_from_program]

  def index
    @programs = Program.where(trainer_id: @trainer.id)
  end

  def show
    @activity = @program.activities.build
    @athletes = @program.athletes
    if current_user.trainer
      @trainer_athletes = @trainer.athletes
      @trainer_athletes = @trainer_athletes - @program_athletes
      respond_to do |format|
        format.js
        format.html
      end
    end
  end

  def new
    @program = Program.new
  end

  def create
    @programs = Program.where(trainer_id: @trainer.id)
    @program = @trainer.programs.build(program_params)
    @program.athletes = Athlete.where(id: athlete_ids)
    if @program.save!
      respond_to do |format|
        format.js
        format.html {redirect_to programs_path}
      end
      # redirect_to programs_path
    else
      render :new
    end
  end

  def update
       @program.update_attributes(program_params)
      # Remove empty strings to avoid collection_select issues
     if @program.save
       (params[:athlete_ids] - []).each do |athlete_id|
         @program.athletes << Athlete.find(athlete_id) if @program.athletes.empty?
       end

      redirect_to program_path
    else
      render :edit
    end
  end

  def athlete_ids
    params.require(:athlete_ids)
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
    athlete = Athlete.find(params[:athlete_id])
    @program_athletes << athlete
    @trainer_athletes = @trainer.athletes.flatten - @program.athletes
    @trainer_athletes.delete(athlete)
    respond_to do |format|
        format.js
        format.html
      end
  end

  def remove_athlete_from_program
    athlete = Athlete.find(params[:athlete_id])
    @program_athletes.delete(athlete)
    @trainer_athletes = @trainer.athletes.flatten - @program.athletes
    @trainer_athletes << athlete
    respond_to do |format|
        format.js
        format.html
      end
  end

  private

    def set_program_athletes
      @program = Program.find(params[:id])
      @program_athletes = @program.athletes
    end

    def set_program
      @program = Program.find(params[:id])
    end

    def set_trainer
      @trainer = current_user.trainer
   end

    def program_params
      params.require(:program).permit(:name, :trainer_id, routines_attributes: [:id, :sets, :reps, :weight, :rest, :duration, :instructions, :exercise_id, :_destroy ])
    end
end
