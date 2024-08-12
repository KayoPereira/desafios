# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb
require "csv"
require_relative "app/models/meal"
require_relative "app/models/customer"
require_relative "app/repositories/meal_repository"
require_relative "app/repositories/customer_repository"
require_relative "app/controllers/meals_controller"
require_relative "app/controllers/customers_controller"
require_relative "app/views/meal_view"
require_relative "app/views/customer_view"
require_relative "router"
require_relative "app/models/employee"
require_relative "app/repositories/employee_repository"

customer_csv_file = "data/customers.csv"
meal_csv_file = "data/meals.csv"

customer_repository = CustomerRepository.new(customer_csv_file)
meal_repository = MealRepository.new(meal_csv_file)

customers_controller = CustomersController.new(customer_repository)
meals_controller = MealsController.new(meal_repository)

router = Router.new(meals_controller, customers_controller)

router.run
