class ApplicationController < ActionController::Base
  include Pagy::Backend
  
  before_action :authenticate_user!, except: [:about]

  before_action :configure_permitted_parameters, if: :devise_controller?

  def favorite_text
    if @favorite_exists
      return "Desfavoritar"
    else
      return "Favoritar"
    end
  end

  helper_method :favorite_text

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :education, :avatar])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :education, :avatar])
    end
end
