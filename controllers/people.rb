require 'json'
require './models/student'
require './models/teacher'

module PeopleController
  def load_people
    people_store = []
    people_file = open('./data/people.json')
    if File.exist?(people_file) && File.read(people_file) != ''
      data = people_file.read
      JSON.parse(data).each do |person|
        people_store << if person['className'] == 'Student'
                          Student.new(person['id'], person['age'], person['name'], person['parent_permission'],
                                      person['classroom'])
                        else
                          Teacher.new(person['id'], person['name'], person['age'], person['specialization'])
                        end
      end
    else
      File.write(people_file, '[]')
    end
    people_store
  end

  def save_people_to_file
    people_store = []
    @people.each do |person|
      if person.is_a?(Student)
        people_store << { id: person.id, age: person.age, name: person.name,
                          parent_permission: person.parent_permission,
                          classroom: person.classroom, className: person.class }
      end
      next unless person.is_a?(Teacher)

      people_store << { id: person.id, name: person.name, age: person.age, specialization: person.specialization,
                        className: person.class }
    end
    File.write('./data/people.json', people_store.to_json)
  end
end
