require_relative '../book'
require_relative '../student'

describe Student do
  context "When testing the student class" do
    before :each do
      @student = Student.new(30, 'Math', 'David')
    end

    it "The student should not be null" do
      expect(@student).to be_truthy
    end

    it "The student's id is a number" do
      expect(@student.id).to be > 0
    end

    it "The student's name should be David" do
      expect(@student.name).to eq('David')
    end

    it "The student's age should be 30" do
      expect(@student.age).to be == 30
    end

    it "The student's can_use_services? should be True" do
      expect(@student.can_use_services?).to be true
    end
    it "The student's classroom should be Math" do
      expect(@student.classroom).to eql('Math')
    end
  end
end