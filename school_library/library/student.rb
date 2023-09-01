require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, name: 'Unknown', parent_permission: true)
    super(generate_random_id, name: name, age: age, parent_permission: parent_permission)
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def assign_to_classroom(classroom)
    @classroom = classroom
    classroom&.add_student(self)
  end

  private

  def generate_random_id
    rand(1..1000)
  end
end
