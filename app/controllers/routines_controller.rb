class RoutinesController < ApplicationController
  def index
    @routines = Routine.all
  end

  def show
  end
end
