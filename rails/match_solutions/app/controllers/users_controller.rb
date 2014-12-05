class UsersController < ApplicationController
  before_action :current_user
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:show, :edit, :update, :destroy, :index]

  # GET /users
  # GET /users.json
  def index
	if @current_user.is_admin?
		@users = User.all
	else
		@users = [ @current_user ]
	end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  	@proj_count = @user.projects.count
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  def self.create_user(user_params)
    @user = User.new(user_params)
	@user.created_at = DateTime.now
	return @user
  end
	
  # POST /users
  # POST /users.json
  def create
	@user = UsersController.create_user(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
	  if params[:id] && params[:id] != "show"
		  @user = User.find(params[:id])
	  else 
		  @user = @current_user
	  end
	  if @user != @current_user && @current_user != nil
		  if !@current_user.is_admin?
		  	@user = @current_user
		  end
	  end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :created_at)
    end
end
