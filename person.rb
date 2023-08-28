class Person
  attr_reader :id, :name, :age

  def initialize(id, name: 'Unknown', age: nil, parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  private

  def of_age?
    @age.to_i >= 18
  end

  public

  def can_use_services?
    @age.nil? || of_age? || @parent_permission
  end
end
