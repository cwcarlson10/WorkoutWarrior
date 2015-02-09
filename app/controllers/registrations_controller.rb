class RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(resource)
    role_path
  end

  def after_update_path_for(resource)
    @trainer = current_user.trainer
    @athlete = current_user.athlete
    if @trainer
      trainer_path(@trainer)
    elsif @athlete
      athlete_path(@athlete)
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :role)
  end
end
