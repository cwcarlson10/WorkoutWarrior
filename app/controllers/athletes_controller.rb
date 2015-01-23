class AthletesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_athlete, only: [:edit, :update, :destroy]

  def index
    @athletes = Athlete.where(trainer_id: nil)
  end

  def show
    @athlete = Athlete.find(params[:id])
  end

  def new
    @athlete = Athlete.new
  end

  def create
    @athlete = Athlete.new(athlete_params)
    @user = User.find(current_user.id)
    @athlete.user_id = @user.id
    @user.update_attributes(role: "athlete")
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

  def assign_trainer
    @athlete = Athlete.find(params[:athlete_id])
    @athlete.trainer_id = params[:trainer_id]
    @athlete.save
      redirect_to trainer_athletes_path(params[:trainer_id])
  end

  private

    def athlete_params
      params.require(:athlete).permit(:name, :user_id, :trainer_id)
    end

    def set_athlete
      @athlete = Athlete.find(params[:id])
    end
end
