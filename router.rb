class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
  end

  def run
    loop do
      print_options
      option = gets.chomp.to_i
      dispatch(option)
    end
  end

  private

  def print_options
    puts "-----------------------"
    puts "Food Delivery          "
    puts "-----------------------"
    puts "1. Create new meal     "
    puts "2. List meals          "
    puts "-----------------------"
    puts "3. Create new customer "
    puts "4. List customers      "
    puts "-----------------------"
    puts "Select one option:     "
    puts "-----------------------"
  end

  def dispatch(option)
    case option
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    end
  end

end
