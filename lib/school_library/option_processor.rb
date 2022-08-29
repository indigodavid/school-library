require_relative '../app'

class OptionProcessor
  def call_actions(option, app)
    case option
    when 1
      list_books(app)
    when 2
      list_people(app)
    when 3
      create_person(app)
    when 4
      create_book(app)
    when 5
      create_rental(app)
    when 6
      list_rentals_by_id(app)
    end
  end

  def list_books(app)
    app.list_books
  end

  def list_people(app)
    app.list_people
  end

  def create_person(app)
    puts 'Do you want to create a Student (1) or a Teacher (2)? [Input the number]:'
    type = gets.chomp.to_i
    puts 'Age: '
    age = gets.chomp.to_i
    puts 'Name: '
    name = gets.chomp
    case type
    when 1
      puts 'Has parent permission? [Y/N]: '
      parent_permission = gets.chomp
      app.create_student(age, name, parent_permission: parent_permission.downcase == 'y')
    when 2
      puts 'Specialization: '
      specialization = gets.chomp
      app.create_teacher(age, specialization, name)
    else
      puts 'Input error. Returning to menu...'
    end
  end

  def create_book(app)
    puts 'Title: '
    title = gets.chomp
    puts 'Author: '
    author = gets.chomp
    app.create_book(title, author)
  end

  def create_rental(app)
    # Display book options
    puts 'Select a book from the following list by number:'
    app.books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    book_index = gets.chomp.to_i

    # Display people options
    puts 'Select a person from the following list by number (not id):'
    app.people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i

    # Get date
    puts 'Date: '
    date = gets.chomp

    app.create_rental(date, person_index, book_index)
  end

  def list_rentals_by_id(app)
    puts 'ID of person'
    id = gets.chomp.to_i
    app.list_rentals_by_id(id)
  end
end
