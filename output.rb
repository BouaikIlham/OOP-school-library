require './person'
require './capitalize_decorator'
require './trimmer_decorator'

person = Person.new(22, 'maximilianus')
puts person.correct_name

# =>> maximilianus
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
# =>> maximilianus

capitalized_trimmed_person = TrimmerDecorator.new(capitalizedPerson)
puts capitalized_trimmed_person.correct_name

#  =>> Maximilian
