class RegistriesController < ApplicationController
  before_action :set_registry, only: [:show, :edit, :update, :destroy]

  # GET /registries
  # GET /registries.json
  def index
    @registries = Registry.all
  end

  # GET /registries/1
  # GET /registries/1.json
  def show
  end

  # GET /registries/new
  def new
    @registry = Registry.new
  end

  # GET /registries/1/edit
  def edit
  end

  # POST /registries
  # POST /registries.json
  def create
    @registry = Registry.new(registry_params)
    cookbook = Cookbook.find(@registry.cookbook_id)

    respond_to do |format|
      if @registry.save
        format.html { redirect_to cookbook_path(cookbook, anchor: 'all'), notice: 'Registry was successfully created.' }
        format.js   {}
        format.json { render :show, status: :created, location: @registry }
      else
        format.html { render :new }
        format.json { render json: @registry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registries/1
  # PATCH/PUT /registries/1.json
  def update
    cookbook = Cookbook.find(@registry.cookbook_id)

    respond_to do |format|
      if @registry.update(registry_params)
        format.html { redirect_to cookbook_path(cookbook, anchor: 'all'), notice: 'Registry was successfully updated.' }
        format.json { render :show, status: :ok, location: @registry }
      else
        format.html { render :edit }
        format.json { render json: @registry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registries/1
  # DELETE /registries/1.json
  def destroy
    cookbook = Cookbook.find(@registry.cookbook_id)
    
    @registry.destroy
    respond_to do |format|
      format.html { redirect_to cookbook_path(cookbook, anchor: 'all'), notice: 'Registry was successfully destroyed.' }
      format.js {}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registry
      @registry = Registry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registry_params
      params.require(:registry).permit(:cookbook_id, :recipe_id)
    end
  end
