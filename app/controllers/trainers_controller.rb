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

  end

  def destroy
  end

  private
    def trainer_params
      params.require(:trainer).permit(:name, :organization, :certification, :email)
    end

    def set_trainer
      @trainer = Trainer.find(params(:id))
    end
end
