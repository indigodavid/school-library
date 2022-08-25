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

end

