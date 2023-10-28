class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    puts "Welcome to our Restaurant!"
    puts "=========================="

    while @running
      display_menu
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @meals_controller.edit
    when 4 then @customers_controller.list
    when 5 then @customers_controller.add
    when 6 then stop
    else
      puts "Please press 1, 2, 3, 4, 5 or 6."
    end
  end

  def stop
    @running = false
  end

  def display_menu
    puts ""
    puts "~~~~~~~~~~~~~MENU~~~~~~~~~~~~~"
    puts "What do you wnat to do?"
    puts ""
    puts "1 - List all Meals"
    puts "2 - Add a new meal"
    puts "3 - Edit a meal"
    puts "4 - List all Customers"
    puts "5 - Add a new Customer"
    puts "6 - Stop and exit the program"
  end
end