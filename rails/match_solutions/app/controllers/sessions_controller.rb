class SessionsController < ApplicationController

  def new

  end
  def create
	user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
	  @subcontractor = user.subcontractor 
	  log_in user
	  redirect_to @subcontractor #"/subcontractors/", :id => @subcontractor.id
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
