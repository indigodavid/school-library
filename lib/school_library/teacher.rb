require_relative 'person'

class Teacher < Person
  attr_reader :specialization

  def initialize(age, specialization, name, id = nil)
    super(age, name, id, parent_permission: true)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
