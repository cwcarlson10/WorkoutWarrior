class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :unassigned_athletes

  def after_sign_in_path_for(resource_or_scope)
    if current_user.role == 'athlete'
      @athlete = Athlete.find_by(user_id: current_user.id)
      athlete_path(@athlete)
    elsif current_user.role == 'trainer'
      @trainer = Trainer.find_by(user_id: current_user.id)
      trainer_path(@trainer)
    elsif current_user.role == 'newuser'
      flash[:notice] = "Please finish signing up!"
      role_path
    end
  end

  def unassigned_athletes
    @unassigned_athletes = Athlete.where( :trainer_id => nil )
  end


end
