class CookbooksController < ApplicationController
  before_action :set_cookbook, only: [:show, :edit, :update, :destroy, :follow, :unfollow, :recipes]

  # GET /cookbooks
  # GET /cookbooks.json
  def index
    @cookbooks = Cookbook.all
  end

  # GET /cookbooks/1
  # GET /cookbooks/1.json
  def show
    respond_to do |format|
      format.html { 
        @cookbook_presenter = CookbookPresenter.new(@cookbook)
      }
      format.json { render :json => @cookbook }
    end
  end

  # GET /cookbooks/new
  def new
    @cookbook = Cookbook.new
  end

  # GET /cookbooks/1/edit
  def edit
  end

  # POST /cookbooks/follow/1
  def follow
    @cookbook.follow(User.find(@current_user))
    redirect_to @cookbook
  end

  # DELETE /cookbooks/follow/1
  def unfollow
    follw = Follower.where(followed_id:@cookbook.id, follower_id:@current_user.id, follower_type: "cookbook")
    puts follw.to_json
    follw.destroy(follw)
    
    redirect_to @cookbook
  end

  # GET /cookbooks/1/recipes
  def recipes
    render json: CookbookPresenter.new(@cookbook).recipes.to_json
  end

  # POST /cookbooks
  # POST /cookbooks.json
  def create
    @cookbook = Cookbook.new(cookbook_params)
    @cookbook[:count_time] = 0
    @cookbook.user = @current_user

    respond_to do |format|
      if @cookbook.save

        @cookbook.follow(User.find(@current_user))
        
        format.html { redirect_to @cookbook, anchor: 'all', notice: 'cookbook was successfully created.' }
        format.json { render json: @cookbook }
      else
        format.html { render :new }
        format.json { render json: @cookbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cookbooks/1
  # PATCH/PUT /cookbooks/1.json
  def update
    respond_to do |format|
      if @cookbook.update(cookbook_params)
        format.html { redirect_to cookbook_path(@cookbook, anchor: 'all'), notice: 'cookbook was successfully updated.' }
        format.json { render :show, status: :ok, location: @cookbook }
      else
        format.html { render :edit }
        format.json { render json: @cookbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cookbooks/1
  # DELETE /cookbooks/1.json
  def destroy
    @cookbook.destroy
    respond_to do |format|
      format.html { redirect_to cookbooks_url, notice: 'cookbook was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cookbook
      @cookbook = Cookbook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cookbook_params
      params.require(:cookbook).permit(:recipes, :persons_amount, :description, :user_id, :name, :image)
    end
  end
