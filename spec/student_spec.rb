require_relative '../school_library/library/student'

describe Student do
  before :each do
    @student = Student.new(25, name: 'John')
    @student_with_permission = Student.new(16, name: 'Alice', parent_permission: true)
  end

  describe '#initialize' do
    it 'takes two parameters and returns a Student object' do
      @student.should be_an_instance_of Student
    end
    it 'should assign the correct name' do
      @student.name.should eql 'John'
    end
    it 'should assign the correct age' do
      @student.age.should eql 25
    end
  end

  describe '#play_hooky' do
    it 'returns the correct message' do
      @student.play_hooky.should eql '¯(ツ)/¯'
    end
  end
end
