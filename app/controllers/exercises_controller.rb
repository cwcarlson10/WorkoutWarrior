class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]

  def index
    @exercise = Exercise.all.order(:category)
  end

  def show
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      redirect_to @exercise
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @exercise.update_attributes(exercise_params)
      redirect_to @exercise
    else
      render :edit
    end
  end

  def destroy
    @exercise.destroy
    redirect_to exercise_path
  end

  private

    def exercise_params
      params.require(:exercise).permit(:title, :description, :category)
    end

    def set_exercise
      @exercise = Exercise.find(params[:id])
    end

end
