require_relative "app/models/meal"
require_relative "app/repositories/meal_repository"

meal = Meal.new(name: "sushi", price: 2000)
pasta = Meal.new(name: "pasta", price: 2000)
# p meal

csv_file_path = "data/meals.csv"
meal_repository = MealRepository.new(csv_file_path)

meal_repository.create(meal)
meal_repository.create(pasta)

p meal_repository
