class WeeksController < ApplicationController
  before_action :set_week, only: [:show, :edit, :update, :destroy]

  # GET /weeks
  # GET /weeks.json
  def index
    @weeks = Week.all
  end

  # GET /weeks/1
  # GET /weeks/1.json
  def show
  end

  # GET /weeks/new
  def new
    @week = Week.new
  end

  # GET /weeks/1/edit
  def edit
  end

  # POST /weeks
  # POST /weeks.json
  def create
    @cookbook = Cookbook.find(week_params[:cookbook_id])
    presenter_cookbook = CookbookPresenter.new( @cookbook )

    # Create monday
    @monday = Day.new
    # Create tuesday
    @tuesday = Day.new
    # Create wednesday
    @wednesday = Day.new
    # Create thursday
    @thursday = Day.new
    # Create friday
    @friday = Day.new
    # Create saturday
    @saturday = Day.new
    # Create sunday
    @sunday = Day.new
    
    if presenter_cookbook.starters.count > 0
      @monday.starter_id = presenter_cookbook.starter_random_id
      @tuesday.starter_id = presenter_cookbook.starter_random_id
      @wednesday.starter_id = presenter_cookbook.starter_random_id
      @thursday.starter_id = presenter_cookbook.starter_random_id
      @friday.starter_id = presenter_cookbook.starter_random_id
      @saturday.starter_id = presenter_cookbook.starter_random_id
      @sunday.starter_id = presenter_cookbook.starter_random_id
    end
    
    if presenter_cookbook.mains.count > 0
      @monday.main_id = presenter_cookbook.main_random_id
      @tuesday.main_id = presenter_cookbook.main_random_id
      @wednesday.main_id = presenter_cookbook.main_random_id
      @thursday.main_id = presenter_cookbook.main_random_id
      @friday.main_id = presenter_cookbook.main_random_id
      @saturday.main_id = presenter_cookbook.main_random_id
      @sunday.main_id = presenter_cookbook.main_random_id
    end

    if presenter_cookbook.desserts.count > 0
      @monday.dessert_id = presenter_cookbook.dessert_random_id
      @tuesday.dessert_id = presenter_cookbook.dessert_random_id
      @wednesday.dessert_id = presenter_cookbook.dessert_random_id
      @thursday.dessert_id = presenter_cookbook.dessert_random_id
      @friday.dessert_id = presenter_cookbook.dessert_random_id
      @saturday.dessert_id = presenter_cookbook.dessert_random_id
      @sunday.dessert_id = presenter_cookbook.dessert_random_id
    end

    @monday.save
    puts @monday.errors.to_json
    @tuesday.save
    @wednesday.save
    @thursday.save
    @friday.save
    @saturday.save
    @sunday.save

    @week = Week.new
    @week.cookbook_id = @cookbook.id
    @week.user = @current_user

    @week.monday = @monday
    @week.tuesday = @tuesday
    @week.wednesday = @wednesday
    @week.thursday = @thursday
    @week.friday = @friday
    @week.saturday = @saturday
    @week.sunday = @sunday

    respond_to do |format|
      if @week.save

        @current_user.week_id = @week.id
        @current_user.save

        @cookbook.count_time = @cookbook.count_time + 1
        @cookbook.save

        format.html { redirect_to @week, notice: 'Week was successfully created.' }
        format.json { render :show, status: :created, location: @week }
      else
        format.html { render :new }
        format.json { render json: @week.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weeks/1
  # PATCH/PUT /weeks/1.json
  def update
    respond_to do |format|
      if @week.update(week_params)
        format.html { redirect_to week_path(@week, anchor: 'week_plan'), notice: 'Week was successfully updated.' }
        format.json { render :show, status: :ok, location: @week }
      else
        format.html { render :edit }
        format.json { render json: @week.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weeks/1
  # DELETE /weeks/1.json
  def destroy
    @week.destroy
    respond_to do |format|
      format.html { redirect_to weeks_url, notice: 'Week was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_week
      @week = Week.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def week_params
      # params.require(:week).permit(:monday_id, :tuesday_id, :wednesday_id, :thursday_id, :friday_id, :saturday_id, :sunday_id)
      params.require(:week).permit!
    end
  end
