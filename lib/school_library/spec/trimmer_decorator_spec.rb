require_relative '../person'
require_relative '../trimmer_decorator'

describe TrimmerDecorator do
  context 'When testing the trimmer_decorator class' do
    before :each do
      @person = Person.new(30, 'Maximilianus')
      @trimmer_decorator = TrimmerDecorator.new(@person)
    end

    it 'The trimmer_decorator should not be null' do
      expect(@trimmer_decorator).to be_truthy
    end

    it "The trimmer_decorator's correct_name should be Maximilian" do
      expect(@trimmer_decorator.correct_name).to eq('Maximilian')
    end
  end
end
