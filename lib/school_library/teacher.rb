require_relative "Person"

class Teacher < Person
  def initialize (age, specialization, name)
    super(age, name, true)
    @specialization = specialization
  end

  def can_use_services?
    return true
  end
end