class AthletesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_athlete, only: [:edit, :update, :destroy]

  def show
    @athlete = Athlete.find(params[:id])
  end

  def index
    @athletes = Athlete.all
  end

  def new
    @athlete = Athlete.new
  end

  def create
    @athlete = Athlete.new(athlete_params)
    @athlete.user_id = current_user.id
    if @athlete.save
      redirect_to @athlete
    else
      render :new
    end
  end

  def edit
  end

  def update
    @athlete.update_attributes(athlete_params)
    if @athlete.save
      redirect_to @athlete
    else
      render :edit
    end
  end

  def destroy
    @athlete.delete
    redirect_to root_path
  end

  private

    def athlete_params
      params.require(:athlete).permit(:name, :trainer, :user_id)
    end

    def set_athlete
      @athlete = Athlete.find(params[:id])
    end
end
