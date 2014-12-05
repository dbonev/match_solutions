module CurrentUser
	extend ActiveSupport::Concern
private
	def get_create_current_user(user_params)
		@current_user = User.find(session[:user_id])
		rescue ActiveRecord::RecordNotFound 
			user = User.find_by(email: user_params[:email].downcase)
			if user != nil
				return nil
			else 
				@current_user = User.create(user_params)
				@current_user.save
				session[:user_id] = @current_user.id
			end
	end 
	
	def authenticate_user(user_params)
		user = User.find_by(email: user_params[:email].downcase)
		if user && user.authenticate(user_params[:password])
		 return user
		end
		return nil
	end
end
