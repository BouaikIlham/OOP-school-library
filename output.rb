require './person'
require './capitalize_decorator'
require './trimmer_decorator'



person = Person.new(22, 'maximilianus')
 puts person.correct_name

# =>> maximilianus
capitalizedPerson = CapitalizeDecorator.new(person)
puts capitalizedPerson.correct_name
# =>> maximilianus

apitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
puts  capitalizedTrimmedPerson.correct_name

#  =>> Maximilian