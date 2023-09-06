require_relative '../library/person'
require_relative '../library/student'
require_relative '../library/teacher'
require 'json'

module CreatePerson
  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp.to_i
    case person_type
    when 1
      create_person_with_details(Student, 'student')
    when 2
      create_person_with_details(Teacher, 'teacher')
    else
      puts 'Invalid choice. Please enter a valid option (1 for student, 2 for teacher).'
    end
  end

  def create_person_with_details(person_class, person_type)
    person = create_person_logic(person_type, person_class)

    people_data = begin
      JSON.parse(File.read('school_library/data/people.json'))
    rescue StandardError
      []
    end

    people_data << {
      'Type' => person.is_a?(Student) ? 'Student' : 'Teacher',
      'Name' => person.name,
      'Age' => person.age,
      'ID' => person.id
    }

    people_data.last['Specialization'] = person.specialization if person.is_a?(Teacher)
    App.setting_should_save_data(true)
    puts "#{person_type.capitalize} created successfully."
  end

  def create_person_logic(person_type, person_class)
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp

    if person_type == 'student'
      parent_permission = parent_permission?
      person = person_class.new(age, name: name, parent_permission: parent_permission)
    elsif person_type == 'teacher'
      print 'Specialization: '
      specialization = gets.chomp
      person = person_class.new(specialization, name: name, age: age)
    end
    person
  end

  def parent_permission?
    print 'Has parent permission? [Y/N]: '
    gets.chomp.downcase == 'y'
  end

  def self.save_data_to_file
    existing_data = begin
      JSON.parse(File.read('school_library/data/people.json'))
    rescue StandardError
      []
    end

    new_data = Person.all.map do |person|
      data = {
        'Type' => person.is_a?(Student) ? 'Student' : 'Teacher',
        'Name' => person.name,
        'Age' => person.age,
        'ID' => person.id
      }

      data['Specialization'] = person.specialization || 'None' if person.is_a?(Teacher)

      data
    end

    combined_data = existing_data + new_data

    File.write('school_library/data/people.json', JSON.pretty_generate(combined_data))
  end
end
