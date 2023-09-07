require_relative '../school_library/library/student'

describe Student do
  before :each do
    @student = Student.new(25)
    @student_without_permission = Student.new(16, name: 'Alice', parent_permission: false)
    @student_with_name = Student.new(25, name: 'John')
  end

  describe '#initialize' do
    it 'takes two parameters and returns a Student object' do
      expect(@student).to be_an_instance_of Student
    end
    it 'should assign the correct name' do
      expect(@student.name).to eql 'Unknown'
    end
    it 'should assign the correct age' do
      expect(@student.age).to eql 25
    end
    it 'should assign the correct parent_permission' do
      expect(@student.parent_permission).to eql true
    end
    it 'should override the default parent_permission' do
      expect(@student_without_permission.parent_permission).to eql false
    end
    it 'should override the default name' do
      expect(@student_with_name.name).to eql 'John'
    end
  end

  describe '#assign_classroom' do
    it 'assigns the correct classroom' do
      my_classroom = Classroom.new('7E Upper')
      @student.assign_to_classroom(my_classroom)
      expect(@student.classroom.label).to eql '7E Upper'
    end
  end

  describe '#play_hooky' do
    it 'returns the correct message' do
      expect(@student.play_hooky).to eql '¯(ツ)/¯'
    end
  end
end
