class ProjectsController < ApplicationController
  include CurrentUser
  before_action :current_user
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:edit, :update, :destroy, :index]

  # GET /projects
  # GET /projects.json
  def index
	if @current_user.is_admin?
		@projects = Project.all
	else 
		@projects = @current_user.projects
	end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
	@project.email = @current_user != nil ? @current_user.email : ""
	@project.name = @current_user != nil && @current_user.subcontractor != nil ? @current_user.subcontractor.name : ""
	@project.location = @current_user != nil && @current_user.subcontractor != nil ? @current_user.subcontractor.location : ""
  end

  # GET /projects/1/edit
  def edit
  end

  def success(id)
  	@project = Project.find(id)
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
	@project.created_at = DateTime.now

	if @current_user == nil && (@project.password == nil || @project.password == "")
		@project.errors.add :password
		respond_to do |format|
			format.html { render :new }
		end
		return
	end
	user_params = {
		email: @project.email,
		password: @project.password
	}
	get_create_current_user(user_params)

	@project.user = @current_user

    respond_to do |format|
      if @project.save
		ProjectMailer.welcome_email(@project).deliver
        format.html { redirect_to success(@project.id), notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to success(@project), notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :email, :description, :location, :created_at, :password)
    end
end
