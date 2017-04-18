class RegistrationsController < Devise::RegistrationsController
	 

=begin
def after_sign_up_path_for(resource)
    blood_banks_path(resource)
  end
=end

	private

	 def sign_up_params
	 	params[:user].permit(:email, :username, :password, :password_confirmation)
	 end

end