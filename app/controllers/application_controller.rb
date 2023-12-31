class ApplicationController < ActionController::Base
     protect_from_forgery with: :exception
     before_action :configure_permitted_parameters, if: :devise_controller?
     before_action :authenticate_user!, unless: :user_signed_in?
     include Pundit::Authorization
     rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
   
     private
   
     def user_not_authorized
       flash[:alert] = "You are not authorized to perform this action."
       redirect_back(fallback_location: root_path)
     end
   
     protected
   
     def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :role) }
   
       devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :role) }
     end
end
   