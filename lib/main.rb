#!/usr/bin/env ruby
require_relative 'app'
require_relative 'school_library/option_processor' 

def print_options
  puts ''
  puts 'Please choose and option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all the rentals for a given person id'
  puts '7 - Exit'
end

def main
  app = App.new
  processor = OptionProcessor.new
  option = 0
  puts 'Welcome to School Library Rental App!'
  while option != 7
    print_options
    option = gets.chomp.to_i
    if option.positive? && option < 7
      processor.call_actions(option, app)
    elsif option == 7
      puts 'Thanks for using this App!'
    else
      puts 'Invalid option'
    end
  end
end

main
