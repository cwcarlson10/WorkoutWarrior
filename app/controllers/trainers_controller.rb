class TrainersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_trainer, only: [:edit, :update, :destroy]

  def show
    @trainer = Trainer.find(params[:id])
  end

  def new
    @new_trainer = Trainer.new
  end

  def create
    @new_trainer = Trainer.new(trainer_params)
    @new_trainer.user_id = current_user.id
    if @new_trainer.save
      redirect_to @new_trainer
    else
      render :new
    end
  end

  def edit
  end

  def update
    @trainer.update_attributes(trainer_params)
    if @trainer.save
      redirect_to @trainer
    else
      render :edit
    end
  end

  def destroy
    @trainer.delete
    redirect_to root_path
  end

  private
    def trainer_params
      params.require(:trainer).permit(:name, :organization, :certification)
    end

    def set_trainer
      @trainer = Trainer.find(params[:id])
    end
end
