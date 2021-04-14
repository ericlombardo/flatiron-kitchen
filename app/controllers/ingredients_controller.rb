class IngredientsController < ApplicationController
  
  def new
    @ingredient = Ingredient.new
  end
  
  def create 
    ingredient = Ingredient.find_or_create_by(name: params[:ingredient][:name])
    redirect_to ingredient
  end

  def show
    @ingredient = Ingredient.find_by_id(params[:id])
  end

  def edit
    @ingredient = Ingredient.find_by_id(params[:id])
  end
  
  def update
    ingredient = Ingredient.find_by_id(params[:id])
    ingredient.update(ingredient_params)
    redirect_to ingredient
  end
  private
  
  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
