require_relative '../school_library/models/book'

describe Book do
  before :each do
    @book = Book.new('My Book', 'Jane Doe')
  end

  describe '#new' do
    it 'takes two parameters and returns a Book object' do
      expect(@book).to be_an_instance_of Book
    end
  end

  describe '#title' do
    it 'returns the correct title' do
      expect(@book.title).to eql 'My Book'
    end
  end

  describe '#author' do
    it 'returns the correct author' do
      expect(@book.author).to eql 'Jane Doe'
    end
  end
end
