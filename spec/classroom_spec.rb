require_relative '../school_library/models/classroom'
require_relative '../school_library/library/student'

describe Classroom do
  before :each do
    @my_classroom = Classroom.new('7E Upper')
  end

  describe '#new' do
    it 'creates a Classroom instance given the label' do
      expect(@my_classroom).to be_an_instance_of Classroom
    end
  end

  describe '#label' do
    it 'returns the correct label' do
      @my_classroom.label.should eql '7E Upper'
    end
  end

  describe 'Add Student'
  it 'accepts new student' do
    my_student = Student.new(10, name: 'Jane')
    @my_classroom.add_student(my_student)
    expect(@my_classroom.students.include?(my_student)).to eql true
    expect(@my_classroom.students[0].name).to eql 'Jane'
  end
end
