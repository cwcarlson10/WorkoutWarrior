class TrainersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_trainer, only: [:edit, :update, :destroy]

  def show
    @trainer = Trainer.find(params[:id])
  end

  def new
    @trainer = Trainer.new
  end

  def create
    @trainer = Trainer.new(trainer_params)
    @user = User.find(current_user.id)
    @trainer.user_id = @user.id
    @user.update_attributes(role: "trainer")
    if @trainer.save
      redirect_to @trainer
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
      params.require(:trainer).permit(:name, :organization, :certification, :user_id)
    end

    def set_trainer
      @trainer = Trainer.find(params[:id])
    end
end
