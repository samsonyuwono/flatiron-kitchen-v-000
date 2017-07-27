class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find_by(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
  @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to @recipe
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find_by(params[:id])
  end

  def update
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end

private

  def recipe_params
    params.require(:recipe).permit(:name)
  end
end
