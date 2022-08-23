require_relative 'school_library/version'
require_relative 'school_library/person'
require_relative 'school_library/teacher'
require_relative 'school_library/student'
require_relative 'school_library/capitalize_decorator'
require_relative 'school_library/trimmer_decorator'

module SchoolLibrary
  class Error < StandardError; end
  # Your code goes here...

  # test base classes
  p1 = Person.new(18, 'Fabian')
  t1 = Teacher.new(35, 'Computer Science', 'David')
  s1 = Student.new(17, '101', 'Leonardo', parent_permission: false)

  p p1
  p t1
  p s1

  p p1.of_age?
  p s1.of_age?

  p t1.can_use_services?
  p s1.can_use_services?

  p s1.play_hooky

  # test decorators
  person = Person.new(22, 'maximilianus')
  p person.correct_name
  capitalizedPerson = CapitalizeDecorator.new(person)
  p capitalizedPerson.correct_name
  capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
  p capitalizedTrimmedPerson.correct_name
end
