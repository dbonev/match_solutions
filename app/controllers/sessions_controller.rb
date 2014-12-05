class SessionsController < ApplicationController

  def new

  end
  def create
	return_url = params[:rurl]
	user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
	  @subcontractor = user.subcontractor 
	  log_in user
	  if return_url 
		  redirect_to return_url #"/subcontractors/", :id => @subcontractor.id
	  else 
		  redirect_to user_show_path(:id => user.id)
	  end
    else
	  flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'    # Create an error message.
    end
  end

  def logout
  	session[:user_id] = nil
	render 'new'
  end

  def destroy
  	logout
  end
end
