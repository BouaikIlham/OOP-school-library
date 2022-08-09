require_relative 'input'
require 'json'
class SaveData < Input
  def initialize
    super()
    load_data
  end

  def load_data
    if File.empty?('books.json')
      puts 'List is empty'
    else
      books = JSON.parse(File.read('books.json'))
      books.each do |book|
        @books.push(Book.new['Title'], book['Author'])
      end
    end

    File.write('books.json', JSON.generate(books))

    if File.empty?('person.json')
      puts 'List is empty'
    else
      persons = JSON.parse(File.read('person.json'))
      persons.each do |person|
        if persons['Class'] == 'Student'
          @persons.push(Student.new(person['Age'], person['Name'], person['parent_permission']))
        else
          persons.push(Teacher.new(person['specialization'], person['Age'], person['Name']))
        end
      end
    end
  end
end
