class ProgramsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_program, only: [:show, :edit, :update, :destroy]

  def index
    @programs = Program.all
  end

  def new
    @program = Program.new
  end

  def create
    @program = @user.programs.build(program_params)
    if @program.save
      redirect_to programs_path
    else
      render :new
    end
  end

  def update
    if @program.update_attributes(program_params)
      redirect_to program_path
    else
      render :edit
    end
  end

  def destroy
    @program.destroy
    redirect_to programs_url
  end

  private
    def set_program
      @program = Program.find(params[:id])
    end

    def set_user
     @user = current_user
   end

    def program_params
      params.require(:program).permit(:name, :user_id, routines_attributes: [:id, :sets, :reps, :duration, :intructions, :exercise_id, :_destroy ])
    end
end
