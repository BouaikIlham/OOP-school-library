require_relative 'app'
require 'json'
class SaveData < App
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

  def load_rentals
    if File.empty?('rentals.json') || !File.exists?('rentals.json')
      puts 'List is empty'
    else
      rentals = JSON.parse(File.read('rentals.json'))
      rentals.each do |rent|
        @rentals.push(Rental.new(rent['date'], @books.select { |book| book.title == rent ['Book']}[0], @ persons.select { |person| person.name == rent['Name']}[0]))
      end
    end
  end
end
