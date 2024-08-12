require_relative 'view'

#  TODO: Define your Controller Class here, to orchestrate the other classes
class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    display_recipes
  end

  def add
    recipe_name = @view.ask_user_for('Qual o nome da receita')
    recipe_description = @view.ask_user_for('Qual a descrição da receita')
    recipe = Recipe.new(recipe_name, recipe_description)
    @cookbook.create(recipe)
    display_recipes
  end

  def remove
    display_recipes
    index = @view.ask_user_for_index('Qual o index da receita que deseja remover')
    @cookbook.destroy(index)
    display_recipes
  end

  private

  def display_recipes
    recipes = @cookbook.all
    @view.display_list(recipes)
  end
end