require_relative 'school_library/student'
require_relative 'school_library/teacher'
require_relative 'school_library/rental'
require_relative 'school_library/classroom'

class App
  attr_accessor :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
    @classroom = ('Default Class')
  end

  def list_books
    if @books.length > 0
      books.each {|book| puts "Title: #{book.title}, Author: #{book.author}"}
    else
      puts 'No books added.'
    end
  end

  def list_people
    if @people.length > 0
      people.each {|person|
        puts "[Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" if person.is_a?(Student)
        puts "[Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" if person.is_a?(Teacher)
      }
    else
      puts 'No people added.'
    end
  end

  def create_student(age, name, parent_permission)
    student = Student.new(age, @classroom, name, parent_permission: parent_permission)
    @people.push(student)
  end

  def create_teacher(age, specialization, name)
    teacher = Teacher.new(age, specialization, name)
    @people.push(teacher)
  end
end
