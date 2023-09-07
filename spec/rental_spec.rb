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
      @rental.should be_an_instance_of Rental
    end
  end

  describe '#date' do
    it 'returns the correct rental date' do
      @rental.date.should eql '1/1/2024'
    end
  end

  describe '#person' do
    it 'assigns the correct person to the rental' do
      @rental.person.name.should eql 'Rose'
      @rental.person.age.should eql 22
    end
  end

  describe '#book' do
    it 'assigns the correct book to the rental' do
      @rental.book.title.should eql 'My Book'
      @rental.book.author.should eql 'Jane Doe'
    end
  end
end
