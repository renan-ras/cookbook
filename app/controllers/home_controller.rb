class HomeController < ApplicationController
  def index
    # @recipes = Recipe.all

    @recipes = Recipe.published

    
    # @recipes << Recipe.new(name: 'Pudim', recipe_type: 'Sobremesa')
    # @recipes << Recipe.new(name: 'Macarronada', recipe_type: 'Prato principal')
  end

  def draft
    @recipes = Recipe.draft
  end
end