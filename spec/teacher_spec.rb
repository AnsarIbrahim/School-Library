require_relative '../school_library/library/teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new('Math', name: 'John', age: 25)
  end

  describe '#initialize' do
    it 'takes two parameters and returns a Teacher object' do
      @teacher.should be_an_instance_of Teacher
    end
    it 'should assign the correct name' do
      @teacher.name.should eql 'John'
    end
    it 'should assign the correct age' do
      @teacher.age.should eql 25
    end
    it 'should assign the correct specialization' do
      @teacher.specialization.should eql 'Math'
    end
  end

  describe '#can_use_services?' do
    it 'returns true' do
      @teacher.can_use_services?.should eql true
    end
  end
end
