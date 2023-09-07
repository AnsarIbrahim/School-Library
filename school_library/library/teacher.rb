require_relative 'person'

class Teacher < Person
  def initialize(specialization, name: 'Unknown', age: nil, parent_permission: true)
    super(generate_random_id, name: name, age: age, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  attr_reader :specialization, :parent_permission

  private

  def generate_random_id
    rand(1..1000)
  end
end
