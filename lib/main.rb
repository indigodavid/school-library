require_relative 'app'

def list_books(app)
  app.list_books()
end

def list_people(app)
  app.list_people()
end

def create_person(app)
  p 'Do you want to create a Student (1) or a Teacher (2)? [Input the number]:'
  type = gets.chomp
  p 'Age: '
  age = gets.chomp.to_i
  p 'Name: '
  name = gets.chomp
  if type == '1'
    p 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp
    app.create_student(age, name, parent_permission: parent_permission.downcase == 'y')
    puts 'Student created successfully'
  elsif type == '2'
    p 'Specialization: '
    specialization = gets.chomp
    app.create_teacher(age, specialization, name)
    puts 'Teacher created successfully'
  else
    'Input error. Going back to menu...'
  end
end

def main
  app = App.new()
  option = 0
  puts 'Welcome to School Library Rental App!'
  while option != '7'
    puts ''
    puts 'Please choose and option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all the rentals for a given person id'
    puts '7 - Exit'

    option = gets.chomp
    case option
    when '1'
      puts '## Books ##'
      list_books(app)
    when '2'
      puts '## People ##'
      list_people(app)
    when '3'
      puts '## Create person ##'
      create_person(app)
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
