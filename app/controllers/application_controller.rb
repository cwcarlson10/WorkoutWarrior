class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource_or_scope)
    if current_user.role != 'newuser'
      @athlete = Athlete.find_by(user_id: @user.id)
    end
    if current_user.role != 'newuser'
      @trainer = Trainer.find_by(user_id: @user.id)
    end
    if current_user.role == 'athlete' && @athlete
      flash[:notice] = "You have been signed in as an athlete!"
      athlete_path(@athlete)
    elsif current_user.role == 'trainer' && @trainer
      flash[:notice] = "You have been signed in as an trainer!"
      trainer_path(@trainer)
    elsif current_user.role == 'newuser'
      flash[:notice] = "Please finish signing up!"
      role_path

    end
  end

end
