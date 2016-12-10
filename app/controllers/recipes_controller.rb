class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy, :follow, :unfollow]

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    @foods = Food.take(10)
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes/follow/1
  def follow
    @recipe.follow(User.find(@current_user))
    redirect_to @recipe
  end

  # DELETE /recipes/follow/1
  def unfollow
    follw = Follower.where(followed_id:@recipe.id, follower_id:@current_user.id, follower_type: "starter").or(Follower.where(followed_id:@recipe.id, follower_id:@current_user.id, follower_type: "main")).or(Follower.where(followed_id:@recipe.id, follower_id:@current_user.id, follower_type: "dessert"))
    puts follw.to_json
    follw.destroy(follw)
    
    redirect_to @recipe
  end



  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    ingredients_array = ActiveSupport::JSON.decode(recipe_params[:ingredients_array])

    @recipe[:count] = 0
    @recipe.user = @current_user

    respond_to do |format|
      if @recipe.save
        ingredients_array.each do |ingredient|
          ing = Ingredient.new
          ing.quantity = ingredient["quantity"].to_i
          ing.unit = ingredient["unit"]
          ing.food_id = ingredient["food_id"]
          ing.recipe = @recipe
          ing.save
        end

        @recipe.follow(User.find(@current_user))

        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name, :persons_amount, :description, :image, :type_menu, :user_id, :ingredients_array)
    end
  end
