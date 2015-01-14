class ProgramsController < ApplicationController
  before_action :set_program, only: [:show, :edit, :update, :destroy]

  def index
    @programs = Program.all
  end

  def new
    @program = Program.new
  end

  def create
    @program = Program.new(program_params)
    @program.save
    redirect_to programs_path
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

    def program_params
      params.require(:program).permit(:name)
    end
end
