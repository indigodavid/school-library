def main
  option = 0
  while option != '7'
    puts 'Welcome to School Library Rental App!'
    puts ''
    puts 'Please choose and option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all the rentals for a given person id'
    puts '7 - Exit'

    p 'Type your option and press Enter:'
    option = gets.chomp
    case option
    when '1'
      puts 'List books'
    when '2'
      puts 'List people'
    when '3'
      puts 'Create person'
    when '4'
      puts 'Create book'
    when '5'
      puts 'Create rental'
    when '6'
      puts 'List rentals'
    when '7'
      puts 'Thanks for using this App!'
    else
      puts 'Invalid option'
    end
  end
end

main()
