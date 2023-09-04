require_relative '../library/person'
require_relative '../library/student'
require_relative '../library/teacher'

module CreatePerson
  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp.to_i

    case person_type
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid choice. Please enter a valid option (1 for student, 2 for teacher).'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'
    Student.new(age, name: name, parent_permission: parent_permission)
    puts 'Student created successfully.'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    Teacher.new(specialization, name: name, age: age)
    puts 'Teacher created successfully.'
  end
end
