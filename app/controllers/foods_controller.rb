class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]

  # GET /foods
  # GET /foods.json
  def index
    if params[:name]
      @foods = Food.where("name LIKE ?", "%#{params[:name]}%")
    else
      # @foods = Food.order(:name).all
      limit = params[:limit]
      if limit.nil?
        limit = 10
      end
      @foods = Food.paginate(:page => params[:page], :per_page => limit)
    end
  end

  # GET /foods/1
  # GET /foods/1.json
  def show
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit
  end

  def find(name)
    Food.where(name: name)
  end

  # POST /foods
  # POST /foods.json
  def create
    @food = Food.new(food_params)
    @food[:count_time] = 0

    respond_to do |format|
      if @food.save
        format.html { redirect_to foods_url, notice: 'Food was successfully created.' }
        format.json { render json: @food }
      else
        format.html { render :new }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1
  # PATCH/PUT /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to foods_url, notice: 'Food was successfully updated.' }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1
  # DELETE /foods/1.json
  def destroy
    @food.destroy
    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_params
      params.require(:food).permit(:name, :image, :count_time)
    end
  end
