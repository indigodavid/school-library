require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', id = nil, parent_permission: true)
    super()
    @age = age
    @name = name
    @parent_permission = parent_permission
    @id = id || Random.rand(1...100_000)
    @rentals = []
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, self, book)
  end
end
