class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end
  
  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.new( params.require(:recipe).permit([:title, 
    :kitchen, :food_type, :serving, :time, :difficulty, :ingredients, :directions]))
    
    if @recipe.save
      redirect_to @recipe
    else
      flash[:error] = 'Campos com (*) são obrigatórios'
      render :new
    end
  end
end
