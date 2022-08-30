require_relative 'school_library/student'
require_relative 'school_library/teacher'
require_relative 'school_library/book'
require_relative 'school_library/rental'
require_relative 'school_library/classroom'
require 'json'

class App
  attr_accessor :people, :books, :rentals

  DATA_DIRECTORY = './lib/library_data/'.freeze
  def initialize
    @people = []
    @books = []
    @rentals = []
    @classroom = 'Default Class'
    read_people_from_file
    read_books_from_file
    read_rentals_from_file
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

  def create_student(age, name, parent_permission, id = nil)
    student = Student.new(age, @classroom, name, id, parent_permission: parent_permission)
    @people.push(student)
    write_people_data
    puts 'Student created successfully'
  end

  def create_teacher(age, specialization, name, id = nil)
    teacher = Teacher.new(age, specialization, name, id)
    @people.push(teacher)
    write_people_data
    puts 'Teacher created successfully'
  end

  def create_book(title, author, id = nil)
    book = Book.new(title, author, id)
    @books.push(book)
    write_books_data
    puts 'Book created successfully'
  end

  def create_rental(date, person_index, book_index)
    rental = Rental.new(date, @people[person_index], @books[book_index])
    @rentals.push(rental)
    write_rentals_data
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
        @books << Book.new(book['title'], book['author'], book['id'])
      end
      books_file.close
    else
      @books = []
      write_books_data
    end
  end

  def write_books_data
    data = if @books.length.positive?
             @books.map do |book|
               { title: book.title, author: book.author, id: book.id }
             end
           else
             []
           end
    books_file = File.open("#{DATA_DIRECTORY}books.json", 'w')
    books_file.write(JSON.pretty_generate(data))
    books_file.close
  end

  def read_people_from_file
    if File.exist?("#{DATA_DIRECTORY}people.json")
      people_file = File.open("#{DATA_DIRECTORY}people.json")
      data = JSON.parse(people_file.read)
      data.each do |person|
        case person['class']
        when 'Student'
          @people << Student.new(person['age'], person['clasroom'], person['name'], person['id'],
                                 parent_permission: person['parent_permission'])
        when 'Teacher'
          @people << Teacher.new(person['age'], person['specialization'], person['name'], person['id'])
        end
      end
      people_file.close
    else
      @people = []
      write_people_data
    end
  end

  def write_people_data
    data = if @people.length.positive?
             @people.map do |person|
               if person.instance_of?(Student)
                 permission = person.parent_permission[:parent_permission]
                 { class: person.class, age: person.age, name: person.name, classroom: person.classroom,
                   parent_permission: permission, id: person.id }
               elsif person.instance_of?(Teacher)
                 { class: person.class, age: person.age, name: person.name, specialization: person.specialization, id: person.id }
               end
             end
           else
             []
           end
    people_file = File.open("#{DATA_DIRECTORY}people.json", 'w')
    people_file.write(JSON.pretty_generate(data))
    people_file.close
  end

  def read_rentals_from_file
    if File.exist?("#{DATA_DIRECTORY}rentals.json")
      rentals_file = File.open("#{DATA_DIRECTORY}rentals.json")
      data = JSON.parse(rentals_file.read)
      data.each do |rental|
        filtered_person = @people.find {|person| rental['person_id'] == person.id}
        filtered_book = @books.find {|book| rental['book_id'] == book.id}
        @rentals << Rental.new(rental['date'], filtered_person, filtered_book)
      end
      rentals_file.close
    else
      @rentals = []
      write_rentals_data
    end
  end

  def write_rentals_data
    data = if @rentals.length.positive?
             @rentals.map do |rental|
               { date: rental.date, person_id: rental.person.id, book_id: rental.book.id}
             end
           else
             []
           end
    rentals_file = File.open("#{DATA_DIRECTORY}rentals.json", 'w')
    rentals_file.write(JSON.pretty_generate(data))
    rentals_file.close
  end
end
