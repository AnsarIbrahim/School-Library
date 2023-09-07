require_relative '../school_library/models/rental'
require_relative '../school_library/models/book'
require_relative '../school_library/library/student'

describe Rental do
  before :each do
    my_book = Book.new('My Book', 'Jane Doe')
    my_person = Student.new(22, name: 'Rose', parent_permission: true)
    @rental = Rental.new('1/1/2024', my_book, my_person)
  end

  describe '#new' do
    it 'takes three parameters and returns a Rental object' do
      expect(@rental).to be_an_instance_of Rental
    end
  end

  describe '#date' do
    it 'returns the correct rental date' do
      expect(@rental.date).to eql '1/1/2024'
    end
  end

  describe '#person' do
    it 'assigns the correct person to the rental' do
      expect(@rental.person.name).to eql 'Rose'
      expect(@rental.person.age).to eql 22
    end
  end

  describe '#book' do
    it 'assigns the correct book to the rental' do
      expect(@rental.book.title).to eql 'My Book'
      expect(@rental.book.author).to eql 'Jane Doe'
    end
  end
end
