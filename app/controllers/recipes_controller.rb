class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(params.require(:recipe)
    .permit(:name, :recipe_type_id, :cuisine, :ingredients, :cook_method, :cook_time))

    # @recipe = Recipe.new(
    #   name: params[:recipe][:name],
    #   recipe_type_id: params[:recipe][:recipe_type_id],
    #   cuisine: params[:recipe][:cuisine],
    #   ingredients: params[:recipe][:ingredients],
    #   cook_method: params[:recipe][:cook_method],
    #   cook_time: params[:recipe][:cook_time]
    # )

    if @recipe.save
      return redirect_to recipe_path(@recipe.id)
    end

    render :new
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])

    deu_certo = @recipe.update(params.require(:recipe)
    .permit(:name, :recipe_type_id, :cuisine, :ingredients, :cook_method, :cook_time))

    if deu_certo
      return redirect_to recipe_path(@recipe.id)
    end

    render :edit
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to root_path
  end

  def publish
    recipe = Recipe.find(params[:id])
    
    if recipe.draft?
      recipe.published!
    else
      recipe.draft!
    end
        
    redirect_to recipe_path(recipe.id)
  end

end