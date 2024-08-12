class MealRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @meals = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  # Create Read Update Destroy

  # Create
  def create(meal)
    meal.id = @next_id
    @meals << meal
    save_csv
    @next_id += 1
  end

  # Read
  def all
    @meals
  end

  # Read
  def find(id)
    # @meals.select { |meal| meal.id == id } # => [meal_x, meal_y, meal_z]
    @meals.find { |meal| meal.id == id } # => meal_x
  end

  # Read
  def find_by_index(index)
    @meals[index]
  end

  # Update
  def update(index, new_price)
    @meals[index].price = new_price
    save_csv
  end

  # Destroy
  def destroy(index)
    @meals.delete_at(index)
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      id = row[:id].to_i
      name = row[:name]
      price = row[:price].to_i
      meal = Meal.new(id: id, name: name, price: price)
      @meals << meal
    end
    @next_id = @meals.last.id + 1 unless @meals.empty?
  end

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << %i[id name price]
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end
