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
        format.html { redirect_to :controller => :projects, :action => :success, id: @project.id, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
	  else 
        format.html { render :index }
        format.json { render json: @project.errors, status: :unprocessable_entity }
	  end	 
	 end
  end

  def contact_params
    params.require(:qlibri_contact).permit(:name, :email, :description)
  end
end
