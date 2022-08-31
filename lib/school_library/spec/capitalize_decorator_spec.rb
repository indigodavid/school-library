require_relative '../person'
require_relative '../capitalize_decorator'

describe CapitalizeDecorator do
  context 'When testing the capitalize_decorator class' do
    before :each do
      @person = Person.new(30, 'david')
      @capitalize_decorator = CapitalizeDecorator.new(@person)
    end

    it 'The capitalize_decorator should not be null' do
      expect(@capitalize_decorator).to be_truthy
    end

    it "The capitalize_decorator's correct_name should be David" do
      expect(@capitalize_decorator.correct_name).to eq('David')
    end
  end
end
