class QlibriController < ApplicationController
  def index
  	@qlibri_contact = QlibriContact.new
  end

  def portfolio
  end

  def contacts
  	@qlibri_contact = QlibriContact.new(contact_params)
	respond_to do |format|
      if @qlibri_contact.save
		ProjectMailer.qlibri_contact_email(@qlibri_contact).deliver
        format.html { render :index } 
		format.js { render action: 'index' }
	  else 
        format.html { render :index }
		format.js { render json: @qlibri_contact.errors, status: :unprocessable_entity }
	  end	 
	 end
  end

  def contact_params
    params.require(:qlibri_contact).permit(:name, :email, :description)
  end
end
