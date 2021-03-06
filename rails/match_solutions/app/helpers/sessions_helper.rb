module SessionsHelper
 def log_in(user)
    session[:user_id] = user.id
 end
 def current_user
    @current_user ||= User.find_by(id: session[:user_id])
 end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  def logged_in_user
	  unless logged_in?
		  flash[:danger] = "Please log in."
		  redirect_to url_for login_url
	  end
  end
end
