class AthletesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_athlete, only: [:edit, :update, :destroy]

  def index
    @athletes = Athlete.where(trainer_id: nil)
  end

  def show
    @athlete = Athlete.find(params[:id])
    if current_user.trainer?
      @trainer = Trainer.find(current_user.trainer.id)
    end
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
      @user.update_attributes(role: "newuser")
      render :new
    end
  end

  def edit
    @old_athlete = 1
  end

  def update
    @athlete.update_attributes(athlete_params)
    respond_to do |format|
      format.html {
        if @athlete.save
          redirect_to @athlete
        else
          render :edit
        end
      }
      format.js
    end
  end

  def remove_from_trainer
    @athlete = Athlete.find(params[:athlete_id])
    @trainer = current_user.trainer
    @athlete.update_attributes(trainer_id: nil)
    @athlete.save
    redirect_to trainer_path(current_user.trainer)
  end

  def destroy
    @athlete.delete
    redirect_to root_path
  end

  private

    def athlete_params
      params.require(:athlete).permit(:name, :user_id, :trainer_id)
    end

    def set_athlete
      @athlete = Athlete.find(params[:id])
    end
end
