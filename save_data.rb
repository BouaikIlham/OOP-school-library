require 'json'
class SaveData
  def initialize
    super()
    load_data
    load_rentals
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
    if File.empty?('rentals.json') || !File.exist?('rentals.json')
      puts 'List is empty'
    else
      rentals = JSON.parse(File.read('rentals.json'))
      rentals.each do |rent|
        @rentals.push(Rental.new(rent['date'], @books.select do |book|
                                                 book.title == rent['Book']
                                               end [0], @persons.select do |person|
                                                          person.name == rent['Name']
                                                        end [0]))
      end
    end
  end

  def save_data
    books = []
    persons = []
    rentals = []
    @books.each do |book|
      books.push({ Title: book.title, Author: book.author })
    end
    @persons.each do |person|
      if person.is_a? Student
        persons.push({ Class: person.class, Classroom: person.classroom, Name: person.name, Age: person.age })
      else
        persons.push({ Class: person.class, Name: person.name, Age: person.age })
      end
    end

    @rentals.each do |rental|
      rentals.push({ date: rental.date, Book: rental.book.title, Name: rental.person.name })
    end
    File.write('books.json', JSON.generate(books))
    File.write('persons.json', JSON.generate(persons))
    File.write('rentals.json', JSON.generate(rentals))
  end
end
