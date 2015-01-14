class RoutinesController < ApplicationController
  before_action :set_routine, only: [:show, :edit, :update, :destroy]

  def index
    @routines = Routine.all
  end

  def new
    @routine = Routine.new
  end

  def create
    @routine = Routine.new(routine_params)
    @routine.save
    redirect_to routines_path
  end

  def update
    if @routine.update_attributes(routine_params)
      redirect_to routine_path
    else
      render :edit
    end
  end

  def destroy
    @routine.destroy
    redirect_to routines_url
  end

  private
    def set_routine
      @routine = Routine.find(params[:id])
    end

    def routine_params
      params.require(:routine).permit(:name)
    end
end
