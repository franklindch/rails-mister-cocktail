class CocktailsController < ApplicationController

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
    redirect_to cocktails_path
  end

  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:id])
    @doses = @cocktail.doses
    @ingredients = Ingredient.all
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
