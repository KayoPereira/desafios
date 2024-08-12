require 'csv'
require_relative 'recipe'

# TODO: Implement the Cookbook class that will be our repository
class Cookbook
  def initialize(csv_file)
    @recipes = []
    @csv_file = csv_file
    load_csv
  end

  def all
    @recipes
  end

  def create(recipe)
    @recipes << recipe
    save_to_csv
  end

  def destroy(index_recipe)
    @recipes.delete_at(index_recipe)
    save_to_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file) do |row|
      @recipes << Recipe.new(row[0], row[1])
    end
  end

  def save_to_csv
    CSV.open(@csv_file, "wb") do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end
end

# cookbook = Cookbook.new('spec/recipes.csv')

# cookbook.all # => todas as minhas receitas
# recipe = Recipe.new('Bolo de cenoura', 'Com cobertura de chocolate')
# cookbook.create(recipe) # => adicionaria ao @recipes a receita do bolo de cenoura
# cookbook.destroy(0) # => removeria a primeira receita do @recipes