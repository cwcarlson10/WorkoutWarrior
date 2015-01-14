class RoutinesController < ApplicationController
  before_action :set_routine, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @routines = Routine.all
  end

  def new
    @routine = Routine.new
  end

  def create
    @routine = @exercise.routines.build(routine_params)
    if @routine.save
      redirect_to @routine
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @routine.update_attributes(routine_params)
      redirect_to @routine
    else
      render :new
    end
  end

  def destroy
    @routine.delete
    redirect_to routines_url
  end

  private

    def set_routine
      @routine = Routine.find(params[:id])
    end

    def set_exercise
      @exercise = Exercise.find(params[:id])
    end

    def set_program
      @program = Program.find(params[:id])
    end

    def routine_params
      params.require(:routine).permit(:sets, :reps, :duration, :instructions)
    end
end
