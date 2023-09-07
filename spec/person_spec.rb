require_relative '../school_library/decorators/nameable'
require_relative '../school_library/library/person'

describe Person do
  let(:person) { Person.new(1, name: 'Unknown', age: 25, parent_permission: true) }

  describe '#initialize' do
    it 'takes three parameters and returns a Person object' do
      expect(person).to be_an_instance_of Person
    end

    it 'should assign the correct id' do
      expect(person.id).to eql 1
    end

    it 'should assign the correct name' do
      expect(person.name).to eql 'Unknown'
    end

    it 'should assign the correct age' do
      expect(person.age).to eql 25
    end

    it 'should assign the correct parent_permission' do
      expect(person.instance_variable_get(:@parent_permission)).to eql true
    end

    it 'should initialize an empty rentals array' do
      expect(person.rentals).to be_empty
    end
  end

  describe '#of_age?' do
    it 'returns true if age is 18 or older' do
      person.age = 20
      expect(person.send(:of_age?)).to be true
    end

    it 'returns false if age is under 18' do
      person.age = 16
      expect(person.send(:of_age?)).to be false
    end
  end

  describe '#can_use_services?' do
    it 'returns true if the person is of age' do
      person.age = 20
      expect(person.can_use_services?).to be true
    end

    it 'returns true if parent permission is granted' do
      person.age = 16
      person.instance_variable_set(:@parent_permission, true)
      expect(person.can_use_services?).to be true
    end

    it 'returns false if neither of age nor parent permission' do
      person.age = 16
      person.instance_variable_set(:@parent_permission, false)
      expect(person.can_use_services?).to be false
    end
  end

  describe '#correct_name' do
    it 'returns the correct name' do
      expect(person.correct_name).to eql 'Unknown'
    end
  end

  describe '#add_rental' do
    it 'adds a rental to the rentals array' do
      rental = double('Rental')
      person.add_rental(rental)
      expect(person.rentals).to include(rental)
    end
  end

  describe 'when name is not provided' do
    it 'defaults to "Unknown"' do
      expect(person.name).to eql 'Unknown'
    end
  end
end
