require_relative '../book'

describe Person do
  context "When testing the Person class" do
    before :each do
      @person = Person.new(30, 'David')
    end

    it "The Person should not be null" do
      expect(@person).to be_truthy
    end

    it "The Person's id is a number" do
      expect(@person.id).to be > 0
    end

    it "The Person's name should be David" do
      expect(@person.name).to eq('David')
    end

    it "The Person's age should be 30" do
      expect(@person.age).to be == 30
    end

    it "The Person's can_use_services? should be True" do
      expect(@person.can_use_services?).to be true
    end
  end
end