require_relative 'school_library/library/person'
require_relative 'school_library/decorators/capitalize_decorator'
require_relative 'school_library/decorators/trimmer_decorator'
require_relative 'school_library/setup/rental'
require_relative 'school_library/setup/classroom'
require_relative 'school_library/setup/student'
require_relative 'school_library/setup/book'

# Create a Person
person = Person.new(22, name: 'Maximilianus')
puts person.correct_name

# Decorate the Person
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name

# Create classrooms
classroom_a = Classroom.new('Class A')
classroom_b = Classroom.new('Class B')

# Create students with age and classroom
student1 = Student.new(18, classroom_a, name: 'Alice')
student2 = Student.new(19, classroom_a, name: 'Bob')
student3 = Student.new(20, classroom_b, name: 'Charlie')

# Add students to classrooms
classroom_a.add_student(student1)
classroom_a.add_student(student2)
classroom_b.add_student(student3)

# Create books
book1 = Book.new('Book 1', 'Author A')
book2 = Book.new('Book 2', 'Author B')

# Create people (assuming a person represents someone who rents a book)
person1 = Student.new(21, classroom_a, name: 'David')

# Rent books
Rental.new('2023-09-01', book1, person1)
Rental.new('2023-09-02', book2, person1)

# Accessing relationships
puts "Classroom A Students: #{classroom_a.students.map(&:name).join(', ')}"
puts "Book 1 Rentals: #{book1.rentals.map { |r| "#{r.person.name} on #{r.date}" }.join(', ')}"
