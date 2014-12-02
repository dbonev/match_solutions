class SubcontractorsController < ApplicationController
  include CurrentUser
  before_action :set_subcontractor, only: [:show, :edit, :update, :destroy]
  before_action :set_link_prefix, only: [:create, :update]

  def set_link_prefix
  	 @current_link = subcontractor_params[:link]
	 if !@current_link.starts_with?
		 @current_link = "http://#{@current_link}"
	 end
  end

  # GET /subcontractors
  # GET /subcontractors.json
  def index
	if params[:id]
		render show
	else 
		@subcontractors = Subcontractor.all
	end
  end

  # GET /subcontractors/1
  # GET /subcontractors/1.json
  def show
  end

  # GET /subcontractors/new
  def new
    @subcontractor = Subcontractor.new
  end

  # GET /subcontractors/1/edit
  def edit
  end

  # POST /subcontractors
  # POST /subcontractors.json
  def create
    @subcontractor = Subcontractor.new(subcontractor_params)
	@subcontractor.created_at = DateTime.now
	@subcontractor.link = @current_link

	user_params = {
		email: @subcontractor.email,
		password: @subcontractor.password
	}
	get_create_current_user(user_params)

	@subcontractor.user = @current_user

    respond_to do |format|
      if @subcontractor.save
		ProjectMailer.subcontractor_email(@subcontractor).deliver
        format.html { redirect_to @subcontractor, notice: 'Subcontractor was successfully created.' }
        format.json { render :show, status: :created, location: @subcontractor }
      else
        format.html { render :new }
        format.json { render json: @subcontractor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subcontractors/1
  # PATCH/PUT /subcontractors/1.json
  def update
    respond_to do |format|
      if @subcontractor.update(subcontractor_params)
        format.html { redirect_to @subcontractor, notice: 'Subcontractor was successfully updated.' }
        format.json { render :show, status: :ok, location: @subcontractor }
      else
        format.html { render :edit }
        format.json { render json: @subcontractor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subcontractors/1
  # DELETE /subcontractors/1.json
  def destroy
    @subcontractor.destroy
    respond_to do |format|
      format.html { redirect_to subcontractors_url, notice: 'Subcontractor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subcontractor
      @subcontractor = Subcontractor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subcontractor_params
      params.require(:subcontractor).permit(:name, :email, :skills, :company_size, :created_at, :location, :link, :description, :password)
    end
end
