class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :follow, :unfollow]

  skip_before_action :require_login, only: [:create, :new]

  # GET /users
  # GET /users.json
  def index
    # @users = User.all
    limit = params[:limit]
    if limit.nil?
      limit = 10
    end
    @users = User.paginate(:page => params[:page], :per_page => limit)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    respond_to do |format|
      format.html { @profile_presenter = ProfilePresenter.new(@user) }
      format.json {
        render :json => @user }
      end
    end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # GET /users/famous.json
  def famous
    hall_of_fames = []
    scores = Follower.where(follower_type: "user").group(:followed_id).order('followed_id asc').count.first(10)
    scores.each do |score|
      user = User.find(score[0])
      hall_of_fames = hall_of_fames + [ user ]
    end
    respond_to do |format|
      format.json { render :json => hall_of_fames, :methods => [:recipes_count, :cookbook_count, :image] }
      format.html { redirect_to users_url }
    end
  end

  # POST /users/follow/1
  def follow
    @user.follow(User.find(@current_user))
    redirect_to @user
  end

  # DELETE /users/follow/1
  def unfollow
    follw = Follower.where(followed_id:@user.id, follower_id:@current_user.id, follower_type: "user")
    puts follw.to_json
    follw.destroy(follw)
    
    redirect_to @user
  end

  # POST /users
  # POST /users.json
  def create
    puts "———————————————— CREATE USER ——————————————"
    puts params.to_json
    puts user_params.to_json
    @user_params = user_params
    if !params[:password].nil?
      puts "hoho"
      @user_params[:password] = params[:password]
    end
    if !params[:password_confirmation].nil?
      puts "hoho"
      @user_params[:password_confirmation] = params[:password_confirmation]
    end
    puts "———————————————— CREATE USER (after modifs) ——————————————"
    puts @user_params.to_json
    @user = User.new(@user_params)
    @user[:country] = "France";

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to root_path(@user, anchor: 'overview'), notice: 'User was successfully created.' }
        format.json { render json: @user }
      else
        puts @user.errors.to_json
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      puts @user.to_json
      if @user.update(user_update_params)
        format.html { redirect_to user_path(@user, anchor: 'overview'), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        puts @user.errors.to_json
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
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :password, :passw, :password_confirmation, :image, :mail, :country)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_update_params
      params.require(:user).permit!
    end
  end
