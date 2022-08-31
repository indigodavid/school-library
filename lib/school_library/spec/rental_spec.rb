require_relative '../rental'
require_relative '../person'
require_relative '../book'

describe Rental do
  context "When testing the rental class" do
    before :each do
      @person = Person.new(30, 'David')
      @book = Book.new('The Shining', 'Stephen King')
      @rental = Rental.new('2022-08-30', @person, @book)
    end

    it "The rental should not be null" do
      expect(@rental).to be_truthy
    end

    it "The rental's date is a number" do
      expect(@rental.date).to eq('2022-08-30')
    end

    it "The rental's person should be instance of Person" do
      expect(@rental.person).to be_instance_of(Person)
    end

    it "The rental's book should be instance of Book" do
      expect(@rental.book).to be_instance_of(Book)
    end
  end
end