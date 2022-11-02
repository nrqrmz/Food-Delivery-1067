# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb

require_relative './app/repositories/meal_repository.rb'
require_relative './app/repositories/customer_repository.rb'
require_relative './app/controllers/meals_controller.rb'
require_relative './app/controllers/customers_controller.rb'
require_relative './router.rb'


meals_csv_file = './data/meals.csv'
meal_repository = MealRepository.new(meals_csv_file)
meals_controller = MealsController.new(meal_repository)

customers_csv_file = './data/customers.csv'
customer_repository = CustomerRepository.new(customers_csv_file)
customers_controller = CustomersController.new(customer_repository)
router = Router.new(meals_controller, customers_controller)
router.run
