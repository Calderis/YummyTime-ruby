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
    puts week_params.to_json
    presenter_cookbook = CookbookPresenter.new(Cookbook.find(week_params[:cookbook_id]))

    # Create monday
    monday = Day.new
    # Create tuesday
    tuesday = Day.new
    # Create wednesday
    wednesday = Day.new
    # Create thursday
    thursday = Day.new
    # Create friday
    friday = Day.new
    # Create saturday
    saturday = Day.new
    # Create sunday
    sunday = Day.new
    
    if presenter_cookbook.starters.count > 0
      monday.starter_id = presenter_cookbook.starters.sample.id
      tuesday.starter_id = presenter_cookbook.starters.sample.id
      wednesday.starter_id = presenter_cookbook.starters.sample.id
      thursday.starter_id = presenter_cookbook.starters.sample.id
      friday.starter_id = presenter_cookbook.starters.sample.id
      saturday.starter_id = presenter_cookbook.starters.sample.id
      sunday.starter_id = presenter_cookbook.starters.sample.id
    end
    
    if presenter_cookbook.mains.count > 0
      monday.main_id = presenter_cookbook.mains.sample.id
      tuesday.main_id = presenter_cookbook.mains.sample.id
      wednesday.main_id = presenter_cookbook.mains.sample.id
      thursday.main_id = presenter_cookbook.mains.sample.id
      friday.main_id = presenter_cookbook.mains.sample.id
      saturday.main_id = presenter_cookbook.mains.sample.id
      sunday.main_id = presenter_cookbook.mains.sample.id
    end
    
    if presenter_cookbook.desserts.count > 0
      monday.dessert_id = presenter_cookbook.desserts.sample.id
      tuesday.dessert_id = presenter_cookbook.desserts.sample.id
      wednesday.dessert_id = presenter_cookbook.desserts.sample.id
      thursday.dessert_id = presenter_cookbook.desserts.sample.id
      friday.dessert_id = presenter_cookbook.desserts.sample.id
      saturday.dessert_id = presenter_cookbook.desserts.sample.id
      sunday.dessert_id = presenter_cookbook.desserts.sample.id
    end
    
    monday.save
    tuesday.save
    wednesday.save
    thursday.save
    friday.save
    saturday.save
    sunday.save

    # créer 7 jours avec 7x3 recettes différentes
    @week = Week.new
    @week.monday = monday
    @week.tuesday = tuesday
    @week.wednesday = wednesday
    @week.thursday = thursday
    @week.friday = friday
    @week.saturday = saturday
    @week.sunday = sunday

    # Destoy previous week
    if @current_user.week == nil
      @current_user.week.destroy
    end

    @week.user = @current_user

    respond_to do |format|
      if @week.save

        @current_user.week = @week
        @current_user.save

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
        format.html { redirect_to @week, notice: 'Week was successfully updated.' }
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
