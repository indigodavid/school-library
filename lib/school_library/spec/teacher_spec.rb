require_relative '../book'
require_relative '../teacher'

describe Teacher do
  context "When testing the teacher class" do
    before :each do
      @teacher = Teacher.new(25, 'Developer', 'David')
    end

    it "The teacher should not be null" do
      expect(@teacher).to be_truthy
    end

    it "The teacher's id is a number" do
      expect(@teacher.id).to be > 0
    end

    it "The teacher's name should be David" do
      expect(@teacher.name).to eq('David')
    end

    it "The teacher's age should be 25" do
      expect(@teacher.age).to be == 25
    end

    it "The teacher's specialization should be Developer" do
      expect(@teacher.specialization).to eql('Developer')
    end
  end
end