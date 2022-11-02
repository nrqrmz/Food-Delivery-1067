require_relative '../views/meals_view.rb'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealsView.new
  end

  def add
    name = @view.ask_user_for('name')
    price = @view.ask_user_for('price').to_i
    meal = Meal.new(name: name, price: price)
    @meal_repository.create(meal)
    display_meals
  end

  def list
    display_meals
  end

  def edit
    display_meals
    index = @view.ask_user_for('index').to_i - 1
    new_meal = @view.edit(@meal_repository.all[index])
    new_meal[:index] = index
    @meal_repository.update(new_meal)
  end

  def destroy
    display_meals
    index = @view.ask_user_for('index you want to destroy').to_i - 1
    @meal_repository.delete(index)
    display_meals
  end

  private

  def display_meals
    meals = @meal_repository.all
    @view.display(meals)
  end
end
