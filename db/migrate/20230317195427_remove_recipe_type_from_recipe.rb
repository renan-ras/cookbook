class RemoveRecipeTypeFromRecipe < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipes, :recipe_type, :string
  end
end
