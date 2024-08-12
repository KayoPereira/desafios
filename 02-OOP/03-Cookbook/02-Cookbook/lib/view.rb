require_relative 'recipe'
# TODO: Define your View class here, to display elements to the user and ask them for their input
class View
  def display_list(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1} - #{recipe.name}: #{recipe.description}"
    end
  end

  def ask_user_for(question)
    puts "#{question.capitalize}?"
    print "> "
    gets.chomp
  end

  def ask_user_for_index(question)
    puts "#{question.capitalize}?"
    print "> "
    gets.chomp.to_i - 1
  end
end
