class CookbooksController < ApplicationController
  before_action :set_cookbook, only: [:show, :edit, :update, :destroy]

  # GET /cookbooks
  # GET /cookbooks.json
  def index
    @cookbooks = cookbook.all
  end

  # GET /cookbooks/1
  # GET /cookbooks/1.json
  def show
  end

  # GET /cookbooks/new
  def new
    @cookbook = cookbook.new
  end

  # GET /cookbooks/1/edit
  def edit
  end

  # POST /cookbooks
  # POST /cookbooks.json
  def create
    @cookbook = cookbook.new(cookbook_params)
    @cookbook[:count] = 0

    respond_to do |format|
      if @cookbook.save
        format.html { redirect_to @cookbook, notice: 'cookbook was successfully created.' }
        format.json { render :show, status: :created, location: @cookbook }
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
        format.html { redirect_to @cookbook, notice: 'cookbook was successfully updated.' }
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
      @cookbook = cookbook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cookbook_params
      params.require(:cookbook).permit(:recipes, :persons_amount, :description, :author_id)
    end
  end
