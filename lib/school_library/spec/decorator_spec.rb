require_relative '../person'
require_relative '../decorator'

describe Decorator do
  context "When testing the Decorator class" do
    before :each do
      @person = Person.new(30, 'David')
      @decorator = Decorator.new(@person)
    end

    it "The decorator should not be null" do
      expect(@decorator).to be_truthy
    end

    it "The decorator's correct_name should be David" do
      expect(@decorator.correct_name).to eq('David')
    end
  end
end
