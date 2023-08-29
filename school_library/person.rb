require_relative 'decorators/nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(id, name: 'Unknown', age: nil, parent_permission: true)
    super()
    @id = id
    self.name = name
    self.age = age
    @parent_permission = parent_permission
  end

  private

  def of_age?
    @age.to_i >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end
end
