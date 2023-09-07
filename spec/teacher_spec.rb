require_relative '../school_library/library/teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new('Math', name: 'John', age: 25)
  end

  describe '#initialize' do
    it 'takes two parameters and returns a Teacher object' do
      expect(@teacher).to be_an_instance_of Teacher
    end
    it 'should assign the correct name' do
      expect(@teacher.name).to eql 'John'
    end
    it 'should assign the correct age' do
      expect(@teacher.age).to eql 25
    end
    it 'should assign the correct specialization' do
      expect(@teacher.specialization).to eql 'Math'
    end
  end

  describe '#can_use_services?' do
    it 'returns true' do
      expect(@teacher.can_use_services?).to eql true
    end
  end
end
