require_relative 'school_library/student'
require_relative 'school_library/teacher'
require_relative 'school_library/book'
require_relative 'school_library/rental'
require_relative 'school_library/classroom'
require 'json'

class App
  attr_accessor :people, :books, :rentals
  DATA_DIRECTORY = "./lib/library_data/"
  def initialize
    @people = []
    @books = []
    @rentals = []
    @classroom = 'Default Class'
    read_people_from_file
    read_books_from_file
  end

  def list_books
    if @books.length.positive?
      books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
    else
      puts 'No books added.'
    end
  end

  def list_people
    if @people.length.positive?
      people.each do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    else
      puts 'No people added.'
    end
  end

  def create_student(age, name, parent_permission)
    student = Student.new(age, @classroom, name, parent_permission: parent_permission)
    @people.push(student)
    write_people_data
    puts 'Student created successfully'
  end

  def create_teacher(age, specialization, name)
    teacher = Teacher.new(age, specialization, name)
    @people.push(teacher)
    write_people_data
    puts 'Teacher created successfully'
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books.push(book)
    write_books_data
    puts 'Book created successfully'
  end

  def create_rental(date, person_index, book_index)
    rental = Rental.new(date, @people[person_index], @books[book_index])
    @rentals.push(rental)
    puts 'Rental created successfully'
  end

  def list_rentals_by_id(person_id)
    filtered_rentals = @rentals.select { |rental| rental.person.id == person_id }
    filtered_rentals.each { |rental| puts "Date: #{rental.date} Book: #{rental.book.title} by #{rental.book.author}" }
  end

  def read_books_from_file
    if File.exist?("#{DATA_DIRECTORY}books.json")
      books_file = File.open("#{DATA_DIRECTORY}books.json")
      data = JSON.parse(books_file.read)
      data.each do |book|
        @books << Book.new(book['title'], book['author'])
      end
      books_file.close
    else
      @books = []
      write_books_data
    end
    
  end

  def write_books_data
    if @books.length > 0
      data = @books.map do |book|
        { title: book.title, author: book.author }
      end
    else
      data = []
    end
    books_file = File.open("#{DATA_DIRECTORY}books.json", "w")
    books_file.write(JSON.pretty_generate(data))
    books_file.close
  end
  
  def read_people_from_file
    if File.exist?("#{DATA_DIRECTORY}people.json")
      people_file = File.open("#{DATA_DIRECTORY}people.json")
      data = JSON.parse(people_file.read)
      data.each do |person|
        if person['class'] == 'Student'
          @people << Student.new(person['age'], person['clasroom'], person['name'], parent_permission: person['parent_permission'])
        elsif person['class'] == 'Teacher'
          @people << Teacher.new(person['age'], person['specialization'], person['name'])
        end
      end
      people_file.close
    else
      @people = []
      write_people_data
    end
  end

  def write_people_data
    if @people.length > 0
      data = @people.map do |person|
        if person.class == Student
          permission = person.parent_permission[:parent_permission]
        { class: person.class, age: person.age, name: person.name, classroom: person.classroom, parent_permission: permission }
        elsif person.class == Teacher
          { class: person.class, age: person.age, name: person.name, specialization: person.specialization }
        end
      end
    else
      data = []
    end
    people_file = File.open("#{DATA_DIRECTORY}people.json", "w")
    people_file.write(JSON.pretty_generate(data))
    people_file.close
  end
end
