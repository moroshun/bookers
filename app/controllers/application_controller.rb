class ApplicationController < ActionController::Base


		before_action :configure_permitted_parameters, if: :devise_controller?
		   def after_sign_in_path_for(resource)
			  blogs_path
			end
			def after_sign_up_path_for(resource)
			  blogs_path
			end


			def after_logout_path_for(resource)
			 	destroy_user_session_path
			end
		protected
		def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
		devise_parameter_sanitizer.permit(:account_update, keys: [:name,:image,:body])
		end

end