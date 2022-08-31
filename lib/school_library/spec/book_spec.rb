require_relative '../book'

describe Book do
  context 'When testing the Book class' do
    before :each do
      @book = Book.new('The Shining', 'Stephen King')
    end

    it 'The book should not be null' do
      expect(@book).to be_truthy
    end

    it "The book's id is a number" do
      expect(@book.id).to be.positive?
    end

    it "The book's title should be The Shining" do
      expect(@book.title).to eq('The Shining')
    end

    it "The book's author should be Stephen King" do
      expect(@book.author).to eql('Stephen King')
    end
  end
end
