require 'csv'
require_relative '../models/meal'

class MealRepository
  # attr_reader :meals
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @meals = []
    @next_id = 1
    load_csv if File.exists?(@csv_file_path)
  end

  def all
    @meals
  end

  def create(meal)
    meal.id = @next_id
    @meals << meal
    @next_id += 1
    save_csv
  end

  def update
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |attributes|
      # p attributes
      attributes[:id] = attributes[:id].to_i
      attributes[:price] = attributes[:price].to_i
      # p attributes 
      @meals << Meal.new(attributes)
    end
    @next_id = @meals.empty? ? @next_id : @meals.last.id + 1
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << ['id', 'name', 'price']
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end
