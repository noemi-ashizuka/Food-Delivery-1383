require_relative "../views/meals_view"

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meals_view = MealsView.new
  end

  def list
    display_meals
  end

  def add
    # ask the view to ask user the name of the meal and store it
    name = @meals_view.ask_for("name")
    # ask user the price of the meal and store it
    price = @meals_view.ask_for("price")
    # create a new meal instance
    meal = Meal.new(name: name, price: price)
    # give the instance to the repository to save
    @meal_repository.create(meal)
  end

  def edit
    # list the meals
    display_meals
    # ask the view to ask the user for a index
    index = @meals_view.ask_for('number').to_i - 1
    # ask the repository for the meals array
    meals = @meal_repository.all
    # use the index to find the meal in the array
    meal = meals[index]
    # ask user for a new name and change the meal name
    meal.name = @meals_view.ask_for('new name')
    # ask user for a new price and change the meal price
    meal.price = @meals_view.ask_for('new price')
    # ask the repository to save the update
    @meal_repository.update
  end

  private

  def display_meals
     # ask the repository for all the meals
     meals = @meal_repository.all
     # ask the view to display the meals
     @meals_view.display(meals)
  end
end
