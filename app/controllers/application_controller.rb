class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  

  def authorize_user(param)
    unless current_user.id == param.to_i
      flash['alert'] = "You are not allowed to perform this action"
      head(:unauthorized) and return false
    end
  end

end
