module CurrentUser
	extend ActiveSupport::Concern
private
	def get_create_current_user(user_params)
		@current_user = User.find(session[:user_id])
		rescue ActiveRecord::RecordNotFound 
			@current_user = User.create(user_params)
			@current_user.save
			session[:user_id] = @current_user.id
	end 
end
