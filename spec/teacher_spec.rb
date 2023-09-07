require_relative '../school_library/library/teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new('Math')
  end

  describe '#initialize' do
    it 'takes two parameters and returns a Teacher object' do
      expect(@teacher).to be_an_instance_of Teacher
    end
    it 'should assign the correct name' do
      expect(@teacher.name).to eql 'Unknown'
    end
    it 'should assign the correct age' do
      expect(@teacher.age).to eql nil
    end
    it 'should assign the correct specialization' do
      expect(@teacher.specialization).to eql 'Math'
    end
    it 'should override the default name' do
      @teacher_with_name = Teacher.new('Math', name: 'John')
      expect(@teacher_with_name.name).to eql 'John'
    end
    it 'should override the default age' do
      @teacher_with_age = Teacher.new('Math', age: 25)
      expect(@teacher_with_age.age).to eql 25
    end
    it 'should override the default permission' do
      @teacher_with_permission = Teacher.new('Math', age: 25, parent_permission: true)
      expect(@teacher_with_permission.parent_permission).to eql true
    end
  end

  describe '#can_use_services?' do
    it 'returns true' do
      expect(@teacher.can_use_services?).to eql true
    end
  end
end
