require_relative 'rental'

class Book
  attr_accessor :title, :author, :rentals
  attr_reader :id

  def initialize(title, author, id = nil)
    @title = title
    @author = author
    @id = id || Random.rand(1...100_000)
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, person, self)
  end
end
