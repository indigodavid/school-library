require_relative '../classroom'

describe Classroom do
  context "When testing the Classroom class" do
    before :each do
      @classroom = Classroom.new('Math')
    end

    it "The Classroom should not be null" do
      expect(@classroom).to be_truthy
    end

    it "The Classroom's students should respond to length" do
      expect(@classroom.students).to respond_to(:length)
    end

    it "The Classroom's label should be Math" do
      expect(@classroom.label).to eq('Math')
    end
  end
end