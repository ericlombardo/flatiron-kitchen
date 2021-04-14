class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    rec = Recipe.new(recipe_params) # create new instance using strong params
    rec.save ? (redirect_to rec) : (render :new) # check if valid #=> recipe view : new form view
  end

  def show
    @recipe = Recipe.find_by_id(params[:id])
  end

  def edit
    @recipe = Recipe.find_by_id(params[:id])
  end

  def update
    rec = Recipe.find_by_id(params[:id])  # find instance of recipe
    rec.update(recipe_params) # update instace using params

    redirect_to rec
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end
end
