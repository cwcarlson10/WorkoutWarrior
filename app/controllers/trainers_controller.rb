class TrainersController < ApplicationController
  before_action :set_trainer, only: [:show, :edit, :update, :destroy]

  def index
    @trainers = Trainer.all
  end

  def show
  end

  def new
    @trainer = Trainer.new
  end

  def create
    @trainer = Trainer.new(trainer_params)
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
    if@trainer.save
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
      params.require(:trainer).permit(:name, :organization, :certification, :email)
    end

    def set_trainer
      @trainer = Trainer.find(params(:id))
    end
end
