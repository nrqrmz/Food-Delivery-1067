class MealsView
  def ask_user_for(smth)
    puts "What is the meal #{smth}?"
    print "> "
    gets.chomp
  end

  def display(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1}. #{meal.name}: $#{meal.price}"
    end
  end

  def edit(meal)
    puts "New name for #{meal.name}:"
    print ">"
    name = gets.chomp
    puts "New price:"
    print ">"
    price = gets.chomp.to_i
    return { name: name, price: price }
  end
end
