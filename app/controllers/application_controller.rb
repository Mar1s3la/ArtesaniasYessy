class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_vent

  def current_vent
    if !session[:vent_id].nil?
      Vent.find(session[:vent_id])
    else
      vent = Vent.create
      session[:vent_id] = vent.id
      return vent
    end
  end

  def authenticate!
    if @current_user == current_admin
      :authenticate_admin!
    elsif @current_user == current_empleado
      :authenticate_empleado!
    end
  end

  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :current_password) }
  end
end
