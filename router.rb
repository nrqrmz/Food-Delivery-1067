# TODO: implement the router of your app.

class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    puts "Welcome to Food Delivery"
    while @running
      display_menu
      route_action
    end
    puts "See you soon! Bye.."
  end

  private

  def display_menu
    puts "1 - Add a new meal"
    puts "2 - List all meals"
    puts "3 - Edit meal"
    puts "4 - Destroy meal"
    puts "5 - Add a new customer"
    puts "6 - List all customers"
    puts "7 - Exit"
  end

  def route_action
    print "> "
    action = gets.chomp
    print `clear`
    case action
    when '1' then @meals_controller.add
    when '2' then @meals_controller.list
    when '3' then @meals_controller.edit
    when '4' then @meals_controller.destroy
    when '5' then @customers_controller.add
    when '6' then @customers_controller.list
    when '7' then stop
    else
      puts 'Please select a valid option'
    end
  end

  def stop
    @running = false
  end
end
