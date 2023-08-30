class Student
  attr_accessor :name, :classroom

  def initialize(name)
    @name = name
    @classroom = nil
    @rentals = []
  end

  attr_reader :rentals
end
