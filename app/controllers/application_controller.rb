class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do 
  	redirect_to root_path, alert: "You are not authorized to access this section"
  	
  end

=begin
def after_sign_up_path_for(resource)
    blood_banks_path(resource)
  end
=end


end


 