class Person
  attr_accessor :age, :name, :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def of_age?
    @age >= 18
  end
  private :of_age

  def method_name?
    of_age? || @parent_permission
  end
end
