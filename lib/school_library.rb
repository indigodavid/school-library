require_relative 'school_library/version'
require_relative 'school_library/person'
require_relative 'school_library/teacher'
require_relative 'school_library/student'

module SchoolLibrary
  class Error < StandardError; end
  # Your code goes here...
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
end
