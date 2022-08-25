require_relative 'school_library/student'
require_relative 'school_library/teacher'
require_relative 'school_library/rental'


class App
  attr_accessor :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
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
        p '[Student]' if person.is_a?(Student)
        p '[Teacher]' if person.is_a?(Teacher)   
        p "Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      }
    else
      puts 'No people added.'
    end
  end
end

