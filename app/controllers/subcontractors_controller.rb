class SubcontractorsController < ApplicationController
  include CurrentUser
  before_action :logged_in_user, only: [:show, :edit, :update, :destroy, :index]
  before_action :set_subcontractor, only: [:show, :edit, :update, :destroy]
  before_action :set_link_prefix, only: [:create, :update]

  def set_link_prefix
  	 @current_link = subcontractor_params[:link]
	 if !@current_link.starts_with? "http://"
		 @current_link = "http://#{@current_link}"
	 end
  end

  # GET /subcontractors
  # GET /subcontractors.json
  def index
	if params[:id]
		render show
	else 
		# everybody coud only see his own data
		if @current_user.is_admin?
			@subcontractors = Subcontractor.all
		else
			if current_user.subcontractor
				@subcontractors = [current_user.subcontractor]
			else
				@subcontractors = []
			end
		end
	end
  end

  # GET /subcontractors/1
  # GET /subcontractors/1.json
  def show
  end

  # GET /subcontractors/new
  def new
	@is_edit = false
  	@submit_title = "Apply as a subcontractor"
	if !logged_in?
		@subcontractor = Subcontractor.new
	else 
		@subcontractor = current_user.subcontractor
		if @subcontractor == nil
			@subcontractor = Subcontractor.new
		elsif
			@subcontractor = current_user.subcontractor
			render :edit
			return
		end
	end
  end

  # GET /subcontractors/1/edit
  def edit
	@is_edit = true
  	@submit_title = "Submit"
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
	  if @subcontractor == nil
		  @subcontractor = Subcontractor.find(params[:id])
	  end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subcontractor_params
      params.require(:subcontractor).permit(:name, :email, :skills, :company_size, :created_at, :location, :link, :description, :password)
    end

end
