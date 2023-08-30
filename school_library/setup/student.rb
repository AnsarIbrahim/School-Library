require_relative '../decorators/nameable'

class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom, name: 'Unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @classroom = classroom
    classroom&.add_student(self)
  end

  def assign_to_classroom(classroom)
    @classroom = classroom
    classroom&.add_student(self)
  end
end
