class TrainersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_trainer, only: [:show, :edit, :update, :destroy, :trainer_athletes]

  def show
    @programs = @trainer.programs
    @trainer_athletes = @trainer.athletes
    @athletes =
      @programs.map do |program|
        program.athletes
      end.flatten
  end

  def new
    @trainer = Trainer.new
  end

  def create
    @trainer = Trainer.new(trainer_params)
    @user = User.find(current_user.id)
    if @user.role == "newuser"
      @trainer.user_id = @user.id
      @user.update_attributes(role: "trainer")
      if @trainer.save
        redirect_to @trainer
      else
        render :new
      end
    else
      flash[:notice] = "You are already an athlete!"
      redirect_to root_path
    end
  end

  def edit
    @old_trainer = 1
    if (current_user && current_user.trainer?)
      @trainer = Trainer.find_by(user_id: current_user.id.to_i)
    end
  end

  def update
    @trainer.update_attributes(trainer_params)
    respond_to do |format|
      format.html {
        if @trainer.save
          redirect_to @trainer
        else
          render :edit
        end
      }
      format.js
    end
  end

  def assign_trainer
    @athlete = Athlete.find(params[:athlete_id])
    @trainer = current_user.trainer
    @trainer_athletes = @trainer.athletes
    @athlete.trainer_id = current_user.trainer.id
    @athlete.save!
      # respond_to do |format|
      #   format.js
      #   format.html {redirect_to trainer_path(params[:trainer_id])}
      # end
      redirect_to @athlete
  end

  def destroy
    @trainer.delete
    redirect_to root_path
  end

  def trainer_athletes
    @trainer_athletes = @trainer.athletes
  end

  def back_button
    @trainer = Trainer.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  private

    def trainer_params
      params.require(:trainer).permit(:name, :organization, :certifications, :bio, :user_id)
    end

    def set_trainer
      @trainer = Trainer.find(params[:id])
    end
end
